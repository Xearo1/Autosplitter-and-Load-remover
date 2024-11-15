// Credit goes to Ero who did 90% of this script and helped me understand a lot of things, as i was new to Load remover making.
// Many thanks to the rest of the Speedrun Tool Development Discord community who also helped me by always pointing me in the right direction.

state("Peaks of Yore") {}

startup
{
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
        { "Alps_1_TrainingTower",        "Tutor's Tower" },
        { "Alps_2_BalancingBoulder",     "Stougr Boulder" },
        { "Alps_3_SeaArch",              "Mara's Arch" },
        { "Alps_4_SunfullSpire",         "Grainne Spire" },
        { "Alps_5_Tree",                 "Great Bók Tree" },
        { "Alps_6_Treppenwald",          "Treppenwald" },
        { "Alps_7_Castle",               "Castle of the Swan King" },
        { "Alps_8_SeaSideTraining",      "Seaside Tribune" },
        { "Alps_9_IvoryGranites",        "Ivory Granites" },
        { "Alps_10_Rekkja",              "Old Rekkja" },
        { "Alps_11_Quietude",            "Quietude" },
        { "Alps_12_Overlook",            "Eljun's Folly" },
        { "Alps2_1_Waterfall",           "Einvald Falls" },
        { "Alps2_2_Dam",                 "Almáttr Dam" },
        { "Alps2_3_Dunderhorn",          "Dunderhorn" },
        { "Alps2_4_ElfenbenSpires",      "Mhòr Druim" },
        { "Alps2_5_WelkinPass",          "Welkin Pass" },
        { "Alps3_1_SeigrCraeg",          "Seigr Craeg" },
        { "Alps3_2_UllrsGate",           "Ullr's Chasm" },
        { "Alps3_3_GreatSilf",           "Great Silf" },
        { "Alps3_4_ToweringVisir",       "Towering Vísir" },
        { "Alps3_5_EldrisWall",          "Eldris Wall" },
        { "Alps3_6_MountMhorgorm",       "Mount Mhòrgorm" },
        { "Alps_Main",                   "Alp Cabin" },
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
        && current.Scene != "Category4_1_Cabin"
        && current.Scene != "Alps_Main";
}

split
{
    return old.Scene != current.Scene
        && old.Scene != "Cabin"
        && old.Scene != "Category4_1_Cabin"
        && old.Scene != "Alps_Main"
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