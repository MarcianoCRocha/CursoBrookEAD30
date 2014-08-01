unit Unit1;

{$mode objfpc}{$H+}
{.$DEFINE DEBUG}
interface

uses
  BrookAction;

type

  {TCliente}

  TCliente = class(TObject)
    Private
      Fid:Int64;
      FNome:String;
    published
      property id: Int64 read Fid write Fid;
      property nome:String read FNome write FNome;
      end;
 {TClienteAction}


 TClienteAction=Class(specialize TBrookGAction<TCliente>)
  public
    procedure Get; override;
    procedure Post; override;

 end;

implementation

{ TClienteAction }

procedure TClienteAction.Get;
begin
  Render('Form.html');
  end;

procedure TClienteAction.Post;
begin
  {$IFDEF DEBUG}
  Write('DEBUG ID: %d, nome: %s',[Entity.id,Entity.nome]);
  {$ELSE}
  Write(Entity);
  {$ENDIF}
end;


initialization
  TClienteAction.Register('*');

end.
