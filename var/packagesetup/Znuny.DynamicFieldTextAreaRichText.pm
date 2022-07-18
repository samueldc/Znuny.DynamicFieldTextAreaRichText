# --
# Znuny.DynamicFieldTextAreaRichText.pm - code run during package de-/installation
# Copyright (C) 2022 samueldc, https://github.com/samueldc
# Maintenance 2022 - samueldc, https://github.com/samueldc
#
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package var::packagesetup::Znuny.DynamicFieldTextAreaRichText;

use strict;
use warnings;

use Kernel::System::VariableCheck qw(:all);
use List::Util qw(min);


our @ObjectDependencies = (
    'Kernel::System::DynamicField',
    'Kernel::System::GenericAgent',
    'Kernel::System::SysConfig',
    'Kernel::System::Valid',
);

=head1 NAME

CordesGraefe.pm - code to excecute during package installation

=head1 SYNOPSIS

All functions

=head1 PUBLIC INTERFACE

=over 4

=cut

=item new()

create an object

=cut

sub new {
    my ( $Type, %Param ) = @_;
    my $Self = {};
    bless( $Self, $Type );

    # create additional objects...
    $Self->{DynamicFieldObject} = $Kernel::OM->Get('Kernel::System::DynamicField');
    $Self->{GenericAgentObject} = $Kernel::OM->Get('Kernel::System::GenericAgent');
    $Self->{ValidObject}        = $Kernel::OM->Get('Kernel::System::Valid');

    # define valid list
    my %Validlist = $Self->{ValidObject}->ValidList();
    my %TmpHash2  = reverse(%Validlist);
    $Self->{ReverseValidList} = \%TmpHash2;
    $Self->{ValidList}        = \%Validlist;

    return $Self;
}

=item CodeInstall()

run the code install part

    my $Result = $CodeObject->CodeInstall();

=cut

sub CodeInstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeReinstall()

run the code reinstall part

    my $Result = $CodeObject->CodeReinstall();

=cut

sub CodeReinstall {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUpgrade()

run the code upgrade part

    my $Result = $CodeObject->CodeUpgrade();

=cut

sub CodeUpgrade {
    my ( $Self, %Param ) = @_;

    return 1;
}

=item CodeUninstall()

run the code uninstall part

    my $Result = $CodeObject->CodeUninstall();

=cut

sub CodeUninstall {
    my ( $Self, %Param ) = @_;

    # remove Dynamic Fields and its values
    $Self->_DynamicFieldsDelete();

    return 1;
}

#-------------------------------------------------------------------------------
# Internal functions

# EO Internal functions
#-------------------------------------------------------------------------------

1;

=back

=head1 TERMS AND CONDITIONS

This Software is part of the OTRS project (http://otrs.org/).

This software comes with ABSOLUTELY NO WARRANTY. For details, see
the enclosed file COPYING for license information (GPL). If you
did not receive this file, see http://www.gnu.org/licenses/agpl.txt.

=cut

#-------------------------------------------------------------------------------

=head1 VERSION
$Revision: 0.1.0 $ $Date: 2022/07/18 15:30:00 $
=cut
