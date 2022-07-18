# Znuny.DynamicFieldTextAreaRichText

This module allows to replace any textarea dynamic field with a rich text editor using only a javascript.
Changes in ```AgentTicketProcess.pm``` are needed to read ```Core.Config.js``` keys related to RichText. Without this changes, RichText ```Core.Config.js``` keys are filled by ```Layout.pm``` only if the window has a article field.

## Requirements

- Znuny 6.x or similar.

## Instructions

- Install the package.
- Suffix you dynamic field textarea with 'RichText' (ex.: DynamicField_MyTextArea**RichText**).
- Load JS at desireble action (problably at ```Loader::Module::AgentTicketProcess###002-ProcessManagement```).