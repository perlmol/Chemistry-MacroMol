package Chemistry::MacroMol;
use 5.006001;
use strict;
use warnings;
use base qw(Chemistry::Mol Exporter);

our $VERSION = '0.01';

=head1 NAME

Chemistry::MacroMol - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Chemistry::MacroMol;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Chemistry::MacroMol, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=cut

our @EXPORT_OK = ();


sub new {
    my $class = shift;
    my %args = @_;
    my $self = bless $class->SUPER::new(), $class;
    $self->{domains} = [];
    $self->$_($args{$_}) for (keys %args);
    return $self;
}


sub add_domain {
    my $self = shift;
    for my $b (@_){
        push @{$self->{domains}}, $b;
	$self->{byId}{$b->{id}} = $b;
    }
    $_[-1];
}


sub new_domain {
    my $self = shift;
    $self->add_domain(Chemistry::Domain->new(@_));
}


=item $mol->domains($n1, ...)

Returns the domains with the given indices, or all by default.

=cut

sub domains {
    my $self = shift;
    if (@_) {
        wantarray ? @{$self->{domains}}[@_] : $self->{domains}[$_[-1]];
    } else {
        @{$self->{domains}};
    }
}



1;



=head1 SEE ALSO

=head1 AUTHOR

Ivan Tubert, E<lt>itub@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2003 by Ivan Tubert

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut

