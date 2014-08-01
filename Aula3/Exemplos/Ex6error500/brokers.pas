unit Brokers;

{$mode objfpc}{$H+}

interface

uses
  BrookFCLHttpAppBroker,BrookUtils;

implementation

initialization
BrookSettings.Page404File:='404.html';
{$IFDEF DEBUG}
BrookSettings.Page500:='@error ' + LineEnding + '@trace';
{$ELSE}
BrookSettings.Page500:='Erro desconhecido,tente mais tarde,kkkkkkkk';
{$ENDIF}

end.
