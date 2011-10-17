use Purple;
%PLUGIN_INFO = (
    perl_api_version => 2,
    name => "Perl Test Plugin",
    version => "0.1",
    summary => "Test plugin for the Perl interpreter.",
    description => "Your description here",
    author => "John H. Kelm <johnhkelm\@gmail.com",
    url => "http://pidgin.im",
    load => "plugin_load",
    unload => "plugin_unload"
);
sub plugin_init {
    return %PLUGIN_INFO;
}
sub plugin_load {
    my $plugin = shift;
    Purple::Debug::info("testplugin", "plugin_load() - Test Plugin Loaded.\n");
}
sub plugin_unload {
    my $plugin = shift;
    Purple::Debug::info("testplugin", "plugin_unload() - Test Plugin Unloaded.\n");
}


