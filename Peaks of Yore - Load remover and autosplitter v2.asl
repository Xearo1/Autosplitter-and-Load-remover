state("Peaks of Yore") {}

startup
{
    settings.Add("stamp%", true, "Stamp%");
    settings.SetToolTip("stamp%", "Check this if you run Stamp%");

    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.LoadSceneManager = true;

    var _settings = new Dictionary<string, string>
    {
        { "TitleScreen",                 "Main Menu" },
        { "Cabin",                       "Cabin" },
        { "Peak_1_GreenhornNEW",         "Greenhorn's Top" },
        { "Peak_2_PaltryNEW",            "Paltry Peak" },
        { "Peak_3_GrayGullyNEW",         "Gray Gully" },
        { "Peak_3_OldMill",              "Old Mill" },
        { "Peak_4_OldManOfSjorNEW",      "Old Man of Sjór" },
        { "Peak_5_GiantsShelfNEW",       "Giant's Shelf" },
        { "Peak_6_OldGroveSkelf",        "Old Grove's Skelf" },
        { "Peak_7_HangmansLeapNEW",      "Hangman's Leap" },
        { "Peak_8_EvergreensEndNEW",     "Evergreen's End" },
        { "Peak_9_TheTwinsNEW",          "The Twins" },
        { "Peak_10_WaltersCragNEW",      "Walter's Crag" },
        { "Peak_11_WutheringCrestNEW",   "Wuthering Crest" },
        { "Peak_13_LandsEndNEW",         "Land's End" },
        { "Peak_14_Cavern",              "Aldr Grotto" },
        { "Peak_15_TheGreatCrevice",     "The Great Crevice" },
        { "Peak_16_ThreeSeaStacks",      "Three Brothers" },
        { "Peak_17_RainyPeak",           "Old Hagger" },
        { "Peak_18_FallingBoulders",     "Ugsome Stórr" },
        { "Peak_19_OldLangr",            "Old Langr" },
        { "Peak_LighthouseNew",          "The Lighthouse" },
        { "Boulder_1_OldWalkersBoulder", "Porter's Boulder" },
        { "Boulder_2_JotunnsThumb",      "Jotunn's Thumb" },
        { "Boulder_3_OldSkerry",         "Old Skerry" },
        { "Boulder_4_TheHamarrStone",    "Hamarr Stone" },
        { "Boulder_5_GiantsNose",        "Giant's Nose" },
        { "Boulder_6_WaltersBoulder",    "Walter's Boulder" },
        { "Boulder_7_SunderedSons",      "Sundered Sons" },
        { "Boulder_8_OldWealdsBoulder",  "Old Weald's Boulder" },
        { "Boulder_9_LeaningSpire",      "Leaning Spire" },
        { "Boulder_10_Cromlech",         "Cromlech" },
        { "Tind_1_WalkersPillar",        "Walker's Pillar" },
        { "Tind_2_Eldenhorn",            "Eldenhorn" },
        { "Tind_3_GreatGaol",            "Great Gaol" },
        { "Tind_4_StHaelga",             "St. Haelga" },
        { "Tind_5_YmirsShadow",          "Ymir's Shadow" },
        { "Category4_1_Cabin",           "North Cabin" },
        { "Category4_1_FrozenWaterfall", "Great Bulwark" },
        { "Category4_2_SolemnTempest",   "Solemn Tempest" },
        { "GameEnding_BaseGame",         "Normal Ending" },
        { "GameEnding_TrueEnding",       "True Ending" },
    };

    vars.Helper.Settings.Create(_settings, defaultValue: true);

}

init
{
    vars.Helper.TryLoad = (Func<dynamic, bool>)(mono =>
    {
      vars.Helper["Loading"] = mono.Make<bool>("InGameMenu", "isLoading");
      vars.Helper["Split"] = mono.Make<bool>("StamperPeakSummit", "currentlyStampingPeakJournal");
      return true;
    });
      

}

update
{
    current.Scene = vars.Helper.Scenes.Active.Name ?? current.Scene;

    // if (old.Scene != current.Scene)
    // {
    //     vars.Log(old.Scene + " -> " + current.Scene);
    // }
}

start
{
    return old.Scene != current.Scene 
        && current.Scene != "TitleScreen"
        && current.Scene != "Cabin"
        && current.Scene != "Category4_1_Cabin";
}

split
{
    if (settings["stamp%"]){
        if (current.Split != old.Split){
        return current.Split;}
     } else 
        return old.Scene != current.Scene
            && old.Scene != "Cabin"
            && old.Scene != "Category4_1_Cabin"
            && settings[old.Scene];
}

reset
{
    return old.Scene != current.Scene
        && current.Scene == "TitleScreen";
}

isLoading
{
    return current.Loading;
}