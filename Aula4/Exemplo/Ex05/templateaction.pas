unit templateaction;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, JTemplate, RUtils, Classes, path;

type

  { TTemplateAction }

  TTemplateAction = class(TBrookAction)
  private
    FTemplate: TJTemplate;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure LoadContent(const AName: string);
    procedure AddField(const AName, AValue: string);
    procedure ShowContent;
    property Template: TJTemplate read FTemplate;
  end;

implementation

{ TTemplateAction }

constructor TTemplateAction.Create;
begin
  inherited Create;
  FTemplate := TJTemplate.Create(nil);
  FTemplate.HtmlSupports := False;
end;

destructor TTemplateAction.Destroy;
begin
  FTemplate.Free;
  inherited Destroy;
end;

procedure TTemplateAction.LoadContent(const AName: string);
begin
  FTemplate.Parser.Content :=
    RUtils.FileToStr(path.TPL_PATH + 'header.html') + LineEnding +
    RUtils.FileToStr(path.TPL_PATH + AName + '.html') + LineEnding +
    RUtils.FileToStr(path.TPL_PATH + 'footer.html');
end;

procedure TTemplateAction.AddField(const AName, AValue: string);
begin
  FTemplate.Parser.Fields.Strings[AName] := AValue;
end;

procedure TTemplateAction.ShowContent;
begin
  FTemplate.Parser.Replace;
  Write(FTemplate.Parser.Content);
end;

end.

