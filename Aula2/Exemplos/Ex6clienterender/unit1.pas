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
  BrookHttpUtils,BrookFCLHttpClientBroker;

{ TForm1 }

procedure TForm1.btObterClick(Sender: TObject);
var
   VLista: TStringList;
   begin
   VLista   := TStringList.Create;
   Try
      VLista.Text:=BrookHttpRequest('http://localhost/cgi-bin/cgi1.bf').Content;
      edID.Text:= VLista.Values['Id'];
      edNome.Text:= VLista.Values['Nome'];
   finally
     VLista.Free;
   end;

end;

end.

