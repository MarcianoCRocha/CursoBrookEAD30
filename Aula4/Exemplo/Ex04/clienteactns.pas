unit clienteactns;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, JTemplate, path;

type

  { TClienteAction }

  TClienteAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

{ TClienteAction }

procedure TClienteAction.Get;
var
  VTemplate: TJTemplate;
begin
  VTemplate := TJTemplate.Create(nil);
  try
    VTemplate.LoadFromFile(path.TPL_PATH + 'form-cliente.html');
    VTemplate.Fields.Add('cliente.titulo', 'Form cliente');
    VTemplate.Fields.Add('cliente.label.id', 'Código');
    VTemplate.Fields.Add('cliente.label.nome', 'Nome do cliente');
    VTemplate.Replace;
    Write(VTemplate.Content.Text);
  finally
    VTemplate.Free;
  end;
end;

initialization
  TClienteAction.Register('/cliente');

end.
