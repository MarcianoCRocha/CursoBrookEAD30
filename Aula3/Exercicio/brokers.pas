unit Brokers;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF CGI} BrookFCLCGIBroker;{$ELSE}BrookFCLHttpAppBroker; {$ENDIF}

implementation

end.
