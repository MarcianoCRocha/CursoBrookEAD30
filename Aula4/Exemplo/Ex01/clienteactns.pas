unit clienteactns;

{$mode objfpc}{$H+}

interface

uses
  BrookAction;

type

  { TClienteAction }

  TClienteAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

const
  FORM_CLIENTE_TPL = {$i form_cliente.inc};

implementation

{ TClienteAction }

procedure TClienteAction.Get;
begin
  Write(FORM_CLIENTE_TPL, ['Form Cliente']);
end;

initialization
  TClienteAction.Register('/cliente');

end.
