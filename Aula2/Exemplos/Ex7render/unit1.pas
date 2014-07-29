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
  Render('D:\Projeto Lazarus\AulaBrook\02 - Primeiros passos\Exemplo Aula 2\Exemplo 7 render\metodorender.txt',[519, 'Marciano Camargo Rocha']);
end;

initialization
  TMyAction.Register('*');

end.
