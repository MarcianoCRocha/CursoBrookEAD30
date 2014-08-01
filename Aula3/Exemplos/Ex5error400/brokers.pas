unit Brokers;

{$mode objfpc}{$H+}

interface

uses
  BrookFCLHttpAppBroker,BrookUtils;

implementation

initialization
BrookSettings.Page404File:='404.html';
BrookSettings.Page500:='Erro: @trace';

end.
