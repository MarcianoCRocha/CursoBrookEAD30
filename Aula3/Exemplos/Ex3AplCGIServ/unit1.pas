unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, sysutils;

type
  TMyAction = class(TBrookAction)
  public
    procedure Get;  override;
    procedure Post; override;
  end;
implementation

procedure TMyAction.Get;
begin
  Render('form.html');
end;
procedure TMyAction.Post;
var
id:Int64;
nome: string;x:String;
begin
  x:= fields.Text; //para verificar o que está sendo passado
  id:=StrToInt64Def(Fields.Values['id'],0);
  nome:= Fields.Values['nome'];
  Write('ID: %d, nome: %s', [id,nome]);
 end;
initialization
  TMyAction.Register('*');

end.
