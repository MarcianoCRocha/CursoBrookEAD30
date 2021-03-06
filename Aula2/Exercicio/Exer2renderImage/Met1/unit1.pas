unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookAction,BrookHttpUtils, classes, sysutils;

type
  TMyAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
begin
  TheResponse.ContentStream := TFileStream.Create( 'D:\Projeto Lazarus\AulaBrook\CursoBrookEAD30\Aula2\Exercicio\Exer2renderImage\images.jpg', fmOpenRead or fmShareDenyWrite);
  try TheResponse.ContentType := 'image/jpg';
    TheResponse.SetCustomHeader('Content-Disposition', 'inline; filename="images.jpg"');
    TheResponse.SendContent;
  finally
    TheResponse.ContentStream.Free;
    TheResponse.ContentStream := nil;
  end;
end;

initialization
  TMyAction.Register('*');

end.
