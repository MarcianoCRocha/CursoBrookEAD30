unit Unit1;

{$mode objfpc}{$H+}

interface

uses
   BrookAction , sysutils , Classes, fpmimetypes;

type
  TMyAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
 const f = 'D:\Projeto Lazarus\AulaBrook\CursoBrookEAD30\Aula2\Exercicio\Exer2renderImage\images.jpg';
 begin
     TheResponse.ContentStream := TFileStream.Create( f, fmOpenRead or fmShareDenyWrite);
   try
    { TheResponse.ContentType := BrookMimeTypeFromFileName(f);// assim da bug com foto jpeg}
     TheResponse.ContentType :=MimeTypes.GetMimeType(f);// funciona normalmente
     TheResponse.SetCustomHeader('Content-Disposition', 'inline; filename="' + ExtractFileName(f) + '"');
     TheResponse.SendContent;
   finally
     TheResponse.ContentStream.Free;
     TheResponse.ContentStream := nil;
 end;
end;

initialization
  TMyAction.Register('*');
   // Caso não possua o arquivo de MIMEs, baixe aqui:
  // https://raw.githubusercontent.com/leledumbo/QTemplate/master/examples/brook/mime.types
  //utilizado somente com metodo mimetypes
  MimeTypes.LoadFromFile({$IFDEF UNIX}'/etc/mime.types'{$ELSE}'D:\Projeto Lazarus\AulaBrook\CursoBrookEAD30\Aula2\Exercicio\Exer2renderImage\Met2\mime.types'{$ENDIF});

end.
