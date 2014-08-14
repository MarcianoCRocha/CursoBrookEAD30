unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookAction;

type
  TMyAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
begin

{$IFDEF CGI}
 Write('Teste apenas CGI');
{$ENDIF}

{$IFDEF DEBUG}
Write('EmbeddeServer teste por DEBUG');
{$ENDIF}

{$IFDEF TRACE}
Write('EmbeddeServer por TRACE');
{$ENDIF}
end;

initialization
  TMyAction.Register('*');

end.
