unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookHttpUtils, BrookAction , sysutils , Classes;

type
  TMyAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
 const f = 'D:\Projeto Lazarus\AulaBrook\CursoBrookEAD30\Aula2\Exercicio\Exer2renderImage\images.jpg';
 begin TheResponse.ContentStream := TFileStream.Create( f, fmOpenRead or fmShareDenyWrite);
   try TheResponse.ContentType := BrookMimeTypeFromFileName(f);
     TheResponse.SetCustomHeader('Content-Disposition', 'inline; filename="' + ExtractFileName(f) + '"');
     TheResponse.SendContent;
   finally
     TheResponse.ContentStream.Free;
     TheResponse.ContentStream := nil;
 end;
end;

initialization
  TMyAction.Register('*');

end.
