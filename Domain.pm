package Chemistry::Domain;
use 5.006001;
use strict;
use warnings;
use base qw(Chemistry::Mol Exporter);
use Carp;

our $VERSION = '0.01';

=head1 NAME

Chemistry::Domain - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Chemistry::Domain;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Chemistry::Domain, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=cut

our @EXPORT_OK = ();

Chemistry::Obj::accessor('parent');
# should add checking to ensure that parent is a Mol


sub new {
    my $class = shift;
    my %args = @_;
    my $self = bless $class->SUPER::new(), $class;
    $self->$_($args{$_}) for (keys %args);
    croak "Must specify parent to Chemistry::Domain->new" unless $self->parent;
    return $self;
}


sub add_atom {
    my $self = shift;
    $self->SUPER::add_atom(@_); # add atom to self (domain)
    $self->parent->add_atom(@_); # add atom to parent (macromol)
}


sub add_bond {
    my $self = shift;
    $self->SUPER::add_bond(@_); # add bond to self (domain)
    $self->parent->add_bond(@_); # add bond to parent (macromol)
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

