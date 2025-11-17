return {
	cmd = { "kotlin-lsp", "--stdio" },
	filetypes = { "kotlin" },
	root_markers = {
		{
			"settings.gradle", -- Gradle (multi-project)
			"settings.gradle.kts", -- Gradle (multi-project)
			"pom.xml", -- Maven
			"build.gradle", -- Gradle
			"build.gradle.kts", -- Gradle
			"workspace.json", -- Used to integrate your own build system
		},
		".git",
	},
}
