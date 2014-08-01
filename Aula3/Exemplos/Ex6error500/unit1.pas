unit Unit1;

{$mode objfpc}{$H+}
{.$DEFINE DEBUG}
interface

uses
  BrookAction,Classes;

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
var
  sl:TStringList;
begin
 sl:=nil;
 sl.SaveToFile('c:\text.txt');

  end;



initialization
  TClienteAction.Register('/cliente');

end.
