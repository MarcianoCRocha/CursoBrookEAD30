unit clienteactns;

{$mode objfpc}{$H+}

interface

uses
  templateactns;

type

  { TClienteAction }

  TClienteAction = class(TTemplateAction)
  public
    constructor Create; overload; override;
    procedure Get; override;
    procedure Post; override;
  end;

implementation

{ TClienteAction }

constructor TClienteAction.Create;
begin
  inherited Create;
  Title := 'Form cliente';
end;

procedure TClienteAction.Get;
begin
  Show('form-cliente');
end;

procedure TClienteAction.Post;
begin
  Show('form-resultado', [Fields.Values['Id'], Fields.Values['Nome']]);
end;

initialization
  TClienteAction.Register('/cliente');

end.
