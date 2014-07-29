unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btObter: TButton;
    edID: TEdit;
    edNome: TEdit;
    lbID: TLabel;
    lbNome: TLabel;
    procedure btObterClick(Sender: TObject);
   end;
    {TCliente}

  TCliente = class(TObject)
  private
    FId    :Integer;
    FNome  :String;

  published
    property Id   :Integer read FId write FId;
    property Nome :String read FNome write FNome;
  end;


var
  Form1: TForm1;

implementation

{$R *.lfm}

uses
  BrookUtils, BrookHttpClient,BrookFCLHttpClientBroker;

{ TForm1 }

procedure TForm1.btObterClick(Sender: TObject);
var
   VDados: TStream;
   VCliente: TCliente;
   VLista: TStringList;
   VHttp: TBrookHttpClient;
begin
   VCliente := TCliente.Create;
   VLista   := TStringList.Create;
   VDados   := TMemoryStream.Create;
   VHttp    := TBrookHttpClient.Create('FclWeb');
   Try
      if not VHttp.Get('http://localhost/cgi-bin/cgi1.bf', VDados) then
         raise Exception.Create('Não foi possível obter os dados do cliente.');
      VDados.Seek(0, 0);
      VLista.LoadFromStream(VDados);
      BrookSafeStringsToObject(VCliente, VLista);
      edID.Text:= IntToStr(VCliente.Id);
      edNome.Text:= VCliente.Nome;
   finally
     VLista.Free;
     VDados.Free;
     VCliente.Free;
     VHttp.Free;
   end;

end;

end.

