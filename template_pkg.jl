using PkgTemplates

t = Template(
    user="davidbp",
    author="David Buchaca Prats",
    dir=".",
    julia=VERSION, # this variable is available once you enter into a specific julia version
    plugins = [
     License(; name="MIT"),
     Git(),
     GitHubActions(),
     Codecov(),
 Documenter{GitHubActions}(),
 ]
)

t("ImageHashes")
