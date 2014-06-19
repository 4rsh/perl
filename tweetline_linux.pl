#!/bin/perl

# +--------------------------------------------+ #
# | TweetLine - Post your Tweets via Terminal. | #
# +--------------------------------------------+ #
# |      Coded by @an0nks & @Kouback_TR_       | #
# +--------------------------------------------+ #
# |      Blogs : koubacktr.wordpress.com       | #
# |              doxnetwork.blogspot.com       | #
# |                                            | #
# |      Facebook: facebook.com/leaksec        | #
# +--------------------------------------------+ #

use WWW::Mechanize;
use LWP;
use Term::ANSIColor qw(:constants);

# CONFIGURAÇÃO DE LOGIN

my $usuario_twitter=""; # Seu nome de usuário. Apenas o nickname, sem o @ (Eg: an0nks) 
my $senha_twitter=""; # Sua senha.

# MECH # :)

sub pergunta {
print WHITE BOLD"Publicar um novo Tweet (em 140 caracteres!)\n> ";
print RESET;
my $mensagem=<STDIN>;

my @twitter_API="https://twitter.com/intent/tweet?source=webclient&text";


my $mech = WWW::Mechanize->new();

$mech -> cookie_jar(HTTP::Cookies->new());
# USERAGENT IPHONE :)
$mech->agent('Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420+ (KHTML, like Gecko) Version/3.0 Mobile/1C28 Safari/419.3'); 
$mech -> post("@twitter_API=$mensagem");
# NULL FORM $mech -> form_name();
$mech -> field ('session[username_or_email]' => $usuario_twitter); # NOME DO INPUT DE USUARIO 
$mech -> field ('session[password]' => $senha_twitter); #NOME DO INPUT DE SENHA
$mech -> click (''); 	# NULL BUTTON

print GREEN BOLD"\n[!]\tTweet postado:\n\t$mensagem\n\n";

$mech-> content();
pergunta();
}

sub banner {
	print GREEN BOLD" _______            __ __   __              
|_     _|.--.--.--.|__|  |_|  |_.-----.----.
  |   |  |  |  |  ||  |   _|   _|  -__|   _|  Created by @";
  print "an0nks & @";
  print "Kouback_TR_
  |___|  |________||__|____|____|_____|__|  \n--------------------------------------------------------------------------------\n";
  print RESET;
  print GREEN"          www.doxnetwork.blogspot.com   &   www.koubacktr.wordpress.com \n\n";
}

system("clear");
banner();
print BLUE BOLD"CONFIGURAÇÃO DE LOGIN\n";
print "Usuario: ";
print RESET;
print BLUE"@";
print "$usuario_twitter\n";
print BLUE BOLD"Senha: ";
print RESET;
print BLUE"$senha_twitter\n\n";

print YELLOW BOLD"Confira se você inseriu direito as variaveis na linha 9 e 10. (ENTER)";
my $response = <STDIN>;
print RESET;
pergunta();
