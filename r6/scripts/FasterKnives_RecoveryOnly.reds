// Mod Settings reads these annotations when installed. Without it, the
// field defaults match the standalone TweakXL YAML values.
public class FasterKnivesRecoverySettings {
    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Knives")
    @runtimeProperty("ModSettings.displayName", "Regular / neurotoxin / butcher / Stinger")
    @runtimeProperty("ModSettings.description", "Lower multiplier means faster return. Re-equip after changing.")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let knife: Float = 0.18;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Knives")
    @runtimeProperty("ModSettings.displayName", "Tanto")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let tanto: Float = 0.10;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Knives")
    @runtimeProperty("ModSettings.displayName", "Chef's knife")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let chef: Float = 0.12;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Knives")
    @runtimeProperty("ModSettings.displayName", "Punk knife")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let punk: Float = 0.40;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Iconics and axe")
    @runtimeProperty("ModSettings.displayName", "Headhunter")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let headhunter: Float = 0.14;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Iconics and axe")
    @runtimeProperty("ModSettings.displayName", "Blue Fang")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let blueFang: Float = 0.06;

    @runtimeProperty("ModSettings.mod", "Faster Knives Recovery")
    @runtimeProperty("ModSettings.category", "Iconics and axe")
    @runtimeProperty("ModSettings.displayName", "Agaou")
    @runtimeProperty("ModSettings.min", "0.01")
    @runtimeProperty("ModSettings.max", "1.00")
    @runtimeProperty("ModSettings.step", "0.01")
    public let agaou: Float = 0.05;
}

public class FasterKnivesRecoveryPoll extends DelayCallback {
    private let player: wref<PlayerPuppet>;
    private let lastKnife: Float;
    private let lastTanto: Float;
    private let lastChef: Float;
    private let lastPunk: Float;
    private let lastHeadhunter: Float;
    private let lastBlueFang: Float;
    private let lastAgaou: Float;

    public static func Create(player: ref<PlayerPuppet>) -> ref<FasterKnivesRecoveryPoll> {
        let callback = new FasterKnivesRecoveryPoll();
        callback.player = player;
        callback.lastKnife = -1.0;
        callback.lastTanto = -1.0;
        callback.lastChef = -1.0;
        callback.lastPunk = -1.0;
        callback.lastHeadhunter = -1.0;
        callback.lastBlueFang = -1.0;
        callback.lastAgaou = -1.0;
        return callback;
    }

    public func Call() {
        if !IsDefined(this.player) { return; }
        let settings = new FasterKnivesRecoverySettings();

        if settings.knife != this.lastKnife {
            TweakDBManager.SetFlat(t"NewFasterKnives_KnifeRecovery.value", settings.knife);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_KnifeRecovery");
            this.lastKnife = settings.knife;
        }
        if settings.tanto != this.lastTanto {
            TweakDBManager.SetFlat(t"NewFasterKnives_TantoRecovery.value", settings.tanto);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_TantoRecovery");
            this.lastTanto = settings.tanto;
        }
        if settings.chef != this.lastChef {
            TweakDBManager.SetFlat(t"NewFasterKnives_ChefRecovery.value", settings.chef);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_ChefRecovery");
            this.lastChef = settings.chef;
        }
        if settings.punk != this.lastPunk {
            TweakDBManager.SetFlat(t"NewFasterKnives_PunkRecovery.value", settings.punk);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_PunkRecovery");
            this.lastPunk = settings.punk;
        }
        if settings.headhunter != this.lastHeadhunter {
            TweakDBManager.SetFlat(t"NewFasterKnives_HeadhunterRecovery.value", settings.headhunter);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_HeadhunterRecovery");
            this.lastHeadhunter = settings.headhunter;
        }
        if settings.blueFang != this.lastBlueFang {
            TweakDBManager.SetFlat(t"NewFasterKnives_BlueFangRecovery.value", settings.blueFang);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_BlueFangRecovery");
            this.lastBlueFang = settings.blueFang;
        }
        if settings.agaou != this.lastAgaou {
            TweakDBManager.SetFlat(t"NewFasterKnives_AgaouRecovery.value", settings.agaou);
            TweakDBManager.UpdateRecord(t"NewFasterKnives_AgaouRecovery");
            this.lastAgaou = settings.agaou;
        }

        GameInstance.GetDelaySystem(this.player.GetGame()).DelayCallback(this, 1.0, false);
    }
}

@wrapMethod(PlayerPuppet)
protected cb func OnGameAttached() -> Bool {
    wrappedMethod();
    GameInstance.GetDelaySystem(this.GetGame()).DelayCallback(FasterKnivesRecoveryPoll.Create(this), 1.0, false);
}
