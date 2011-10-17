use Chatbot::Eliza;
use Purple;

$chatbot = new Chatbot::Eliza;

%PLUGIN_INFO = (
	perl_api_version => 2,
	name => "ChatBot",
	version => "0.1",
	summary => "Yay! It's a chatbot!",
	description => "It... chats...",
	author => "Alex Griessman <alex.griessman@gmail.com>",
	url => "http://pidgin.im/",
	load => "plugin_load",
	unload => "plugin_unload",
);

sub plugin_init {
	return %PLUGIN_INFO;
}

sub bot_enabled {
	$current_status = Purple::SavedStatus::get_current();
	Purple::Debug::info("ChatBot", $current_status->get_title() . "\n");
	if($current_status->get_title() eq "Bot") {
		return 1
	} else {
		return 0
	}
}

sub reply_to_message {
	my ($account, $sender, $message, $conv, $flags) = @_;
	if(bot_enabled()) {
		$conv1 = Purple::Conversation->new(1, $account, $sender);
		$im = $conv1->get_im_data();

		Purple::Debug::info("Chatbot", "Recieved -> " . $message . "\n");
		$reply = $chatbot->transform( $message );
		Purple::Debug::info("ChatBot", "Sending ->" . $reply . "\n");
		sleep(20);
		$im->send($reply);
	}
}

sub plugin_load {
	my $plugin = shift;
	$conversation_handle = Purple::Conversations::get_handle();
	Purple::Signal::connect($conversation_handle, "received-im-msg", $plugin, \&reply_to_message, $data);
	Purple::Debug::info("ChatBot", "Loading!\n");
}

sub plugin_unload {
	my $plugin = shift;
	Purple::Debug::info("ChatBot", "Unloading!\n");
}
