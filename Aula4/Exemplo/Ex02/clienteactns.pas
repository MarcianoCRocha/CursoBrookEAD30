unit clienteactns;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, path;

type

  { TClienteAction }

  TClienteAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

{ TClienteAction }

procedure TClienteAction.Get;
begin
  Render(path.TPL_DIR + 'form-cliente.html', ['Form cliente']);
end;

initialization
  TClienteAction.Register('/cliente');

end.
