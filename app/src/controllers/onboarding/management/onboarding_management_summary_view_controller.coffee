class @OnboardingManagementSummaryViewController extends @OnboardingViewController

  navigation:
    continueUrl: '/onboarding/management/provisioning'


  initialize: ->
    super
    if @params.swapped_bip39
      @navigation.continueUrl = '/onboarding/device/swapped_bip39_provisioning'
    else if ledger.app.dongle.getFirmwareInformation().hasSubFirmwareSupport()
      @navigation.continueUrl = '/onboarding/device/switch_firmware'

  navigationContinueParams: ->
    pin: @params.pin
    mnemonicPhrase: @params.mnemonicPhrase
    mode: 'operation'