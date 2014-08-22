unit templateactns;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, RUtils, path;

type

  { TTemplateAction }

  TTemplateAction = class(TBrookAction)
  private
    FTitle: string;
  public
    procedure Show(const AName: string; const AArgs: array of const);
    procedure Show(const AName: string);
    property Title: string read FTitle write FTitle;
  end;

implementation

{ TTemplateAction }

procedure TTemplateAction.Show(const AName: string;
  const AArgs: array of const);
begin
  Write(RUtils.FileToStr(path.TPL_DIR + 'header.html'), [Title]);
  Write(RUtils.FileToStr(path.TPL_DIR + AName + '.html'), AArgs);
  Write(RUtils.FileToStr(path.TPL_DIR + 'footer.html'));
end;

procedure TTemplateAction.Show(const AName: string);
begin
  Show(AName, []);
end;

end.

