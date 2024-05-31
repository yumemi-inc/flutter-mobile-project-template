# GitHub Copilot

Language: English | [日本語](/docs/ja/COPILOT.md)

> [!NOTE]
> This document is based on Yumemi's internal document 「[ChatGPTをはじめとするAIサービスの利用方針・ルール・ガイドライン](https://www.notion.so/yumemi/ChatGPT-AI-f951c2e2542e4db5af72386329e23155)」. If you are a member of Yumemi, please read the guidelines first.

## Risks of Generating AI in General

Generative AI in general has the following risks that require attention. When using it, you need to be fully aware of them with the parties involved.

### Risks under copyright law

Automatically generated source code may infringe on the copyrights of others' source code.

### Security Risks

May generate code with security risks, such as insecure coding patterns, bugs, or use of outdated APIs or libraries.

### Privacy Risks

There is concern that sensitive or personal information may be learned and that this information may be displayed to third parties. It is important to note what information those tools collect from projects and use for learning.

## Risks of GitHub Copilot

GitHub Copilot can be used by setting up a subscription. Subscriptions are available for individuals and organizations as follows. Note that each has a different privacy policy.

- [GitHub Copilot Individual](https://docs.github.com/ja/copilot/overview-of-github-copilot/about-github-copilot-individual)
- [GitHub Copilot Business](https://docs.github.com/ja/copilot/overview-of-github-copilot/about-github-copilot-business)

### Risk as an extension of the IDE

Note that the extent to which the GitHub Copilot extension can be enabled depends on the IDE. In VSCode and Xcode, it is possible to enable it on a per-project basis, but in other IDEs, it cannot be controlled on a per-project basis, so you must be careful not to accidentally run Copilot.

## How to use Copilot

### VSCode

1. Install [GitHub Copilot extension](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot) to VSCode
2. Disable the Copilot extension so that Copilot does not work throughout VSCode
3. Open any workspace and enable the Copilot extension in that workspace only
4. Add the following GitHub Copilot configuration to the workspace settings (`.vscode/settings.json`)

    ```jsonc
    {
      "github.copilot.enable": {
        // Specify the language in which Copilot is to be enabled
        "*": false,
        "dart": true
      },
      "github.copilot.editor.enableCodeActions": true,
      "github.copilot.editor.enableAutoCompletions": true,
    }
    ```

5. (Optional) Disable Copilot in the overall VSCode settings (`settings.json`)

```json
{
  "github.copilot.enable": {
    "*" : false,
  },
  "github.copilot.editor.enableCodeActions": false,
  "github.copilot.editor.enableAutoCompletions": false,
}
```

VSCode - Programming Languages Overview
<https://code.visualstudio.com/docs/languages/overview>

List of languages supported by VSCode
<https://code.visualstudio.com/docs/languages/identifiers>

> [!NOTE]
> This setting has already been applied to the project, but when a repository is created using GitHub's > template feature, a workflow is executed to override it so that the setting is disabled
>
### Xcode

1. Install [Copilot for Xcode](https://github.com/intitni/CopilotForXcode)
2. Follow the README to activate Copilot for Xcode
3. Open the Copilot for Xcode app and activate `Disable Suggestion Feature Globally` in the `Feature tab`
4. Click on the `Exception List` next to step 3 and add the project path you want to enable Copilot for.

## Reference

<https://docs.github.com/ja/copilot>
