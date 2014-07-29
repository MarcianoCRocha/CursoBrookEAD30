unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookAction,{}sysutils{usada formatação data hora etc};

type
  TMyAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
begin

  Write('Olá mundo');//exemplo 1
  Write('A hora atual é: %s',[DateTimeToStr(now)]); //exemplo 2
  Write('Integer id: %d',[10]);//exemplo 3
end;

initialization
  TMyAction.Register('*');

end.
