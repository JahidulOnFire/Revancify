#!/usr/bin/bash

initiateWorkflow() {
    while true; do
        case "$TASK" in
        "CHOOSE_APP")
            chooseApp || break
            TASK="FETCH_APP"
            ;;
        "FETCH_APP")
            "$APP_TASK"App || continue
            TASK="MANAGE_PATCHES"
            ;;
        "MANAGE_PATCHES")
            managePatches || continue
            TASK="EDIT_OPTIONS"
            ;;
        "EDIT_OPTIONS")
            editOptions || continue
            TASK="PATCH_APP"
            ;;
        "PATCH_APP")
            patchApp || break
            TASK="INSTALL_APP"
            ;;
        "INSTALL_APP")
            installApp
            break
            ;;
        esac
    done
}
