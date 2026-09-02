// /ctx-* commands for context-mode tools

import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function activate(pi: ExtensionAPI) {
  pi.registerCommand("ctx-stats", {
    description:
      "Context savings — per-tool breakdown, tokens consumed, savings ratio.",
    handler: async (_args, ctx) => {
      await ctx.waitForIdle();
      pi.sendUserMessage("context-mode stats", {
        deliverAs: "followUp",
      });
    },
  });

  pi.registerCommand("ctx-doctor", {
    description:
      "Diagnostics — runtimes, hooks, FTS5, plugin registration, versions.",
    handler: async (_args, ctx) => {
      await ctx.waitForIdle();
      pi.sendUserMessage("context-mode doctor", {
        deliverAs: "followUp",
      });
    },
  });

  pi.registerCommand("ctx-index", {
    description:
      "Index a local file or directory into the persistent FTS5 knowledge base.",
    getArgumentCompletions: () => [],
    handler: async (args, ctx) => {
      await ctx.waitForIdle();
      pi.sendUserMessage(`context-mode index "${args}"`, {
        deliverAs: "followUp",
      });
    },
  });

  pi.registerCommand("ctx-search", {
    description: "Search previously indexed content.",
    getArgumentCompletions: () => [],
    handler: async (args, ctx) => {
      await ctx.waitForIdle();
      pi.sendUserMessage(`context-mode search "${args}"`, {
        deliverAs: "followUp",
      });
    },
  });

  pi.registerCommand("ctx-upgrade", {
    description: "Pull latest, rebuild, migrate cache, fix hooks.",
    handler: async (_args, ctx) => {
      await ctx.waitForIdle();
      pi.sendUserMessage("context-mode upgrade", {
        deliverAs: "followUp",
      });
    },
  });

  pi.registerCommand("ctx-purge", {
    description: "Delete indexed content (usage: /ctx-purge [global|project])",
    handler: async (args, ctx) => {
      const scope = args?.trim() === "global" ? "global" : "project";
      const ok = await ctx.ui.confirm(
        "Purge indexed content?",
        `Scope: ${scope} — cannot undo.`,
      );
      if (!ok) {
        ctx.ui.notify("Purge cancelled.", "info");
        return;
      }
      await ctx.waitForIdle();
      pi.sendUserMessage(
        scope === "global"
          ? "Call ctx_purge with scope global now, no commentary."
          : "Call ctx_purge now, no commentary.",
        { deliverAs: "followUp" },
      );
    },
  });
}
