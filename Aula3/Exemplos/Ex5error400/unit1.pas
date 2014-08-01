unit Unit1;

{$mode objfpc}{$H+}
{.$DEFINE DEBUG}
interface

uses
  BrookAction, sysutils;

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


 end;

implementation

{ TClienteAction }

procedure TClienteAction.Get;
begin
 StrToInt('A');
  end;



initialization
  TClienteAction.Register('/cliente');

end.
