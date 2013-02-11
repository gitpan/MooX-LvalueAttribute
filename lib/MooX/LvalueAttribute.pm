#
# This file is part of MooX-LvalueAttribute
#
# This software is copyright (c) 2013 by Damien "dams" Krotkine.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package MooX::LvalueAttribute;
{
  $MooX::LvalueAttribute::VERSION = '0.10';
}
use strictures 1;

# ABSTRACT: Provides Lvalue accessors to Moo class attributes

use Moo ();
use Moo::Role ();

sub import {
    my $class = shift;
    my $target = caller;

    unless ($Moo::MAKERS{$target} && $Moo::MAKERS{$target}{is_class}) {
        die "MooX::LvalueAttribute can only be used on Moo classes.";
    }

    Moo::Role->apply_roles_to_object(
      Moo->_accessor_maker_for($target),
      'Method::Generate::Accessor::Role::LvalueAttribute',
    );

}



1;

__END__

=pod

=head1 NAME

MooX::LvalueAttribute - Provides Lvalue accessors to Moo class attributes

=head1 VERSION

version 0.10

=head1 SYNOPSIS

  package App;
  use Moo;
  use MooX::LvalueAttribute;
  
  has name => (
    is => 'rw',
    lvalue => 1,
  );

  # Elsewhere

  my $app = App->new(name => 'foo');
  $app->name = 'Bar';
  print $app->name;  # Bar

=head1 DESCRIPTION

B<WARNING>: this module is in its early stage, its API may change.

This modules provides Lvalue accessors to your Moo attributes. It won't break
Moo's encapsulation, and will properly call any accessor method modifiers,
triggers, builders and default values creation.

It means that instead of writing:

  $object->name("Foo");

you can use:

  $object->name = "Foo"; 

=head1 ATTRIBUTE SPECIFICATION

To enable Lvalue access to your attribute, simply use C<MooX::LvalueAttribute>
in the class, and add:

  lvalue => 1,

in the attribute specification (see synopsis).

=head1 NOTE ON IMPLEMENTATION

The implementation doesn't use AUTOLOAD, nor TIESCALAR. Instead, it uses a
custom accessor and C<Variable::Magic>, which is faster than the tie mechanism.

=head1 AUTHOR

Damien "dams" Krotkine

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Damien "dams" Krotkine.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
