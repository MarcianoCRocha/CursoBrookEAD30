unit clienteactns;

{$mode objfpc}{$H+}

interface

uses
  templateaction;

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
  AddField('cliente.titulo', 'Form cliente');
  AddField('cliente.label.id', 'ID');
  AddField('cliente.label.nome', 'Nome');
end;

procedure TClienteAction.Get;
begin
  LoadContent('cliente.form');
  AddField('cliente.pagina.cor', 'yellow');
  AddField('cliente.descricao', 'Inserir cliente');
  AddField('cliente.rodape', '');
  ShowContent;
end;

procedure TClienteAction.Post;
begin
  LoadContent('cliente.result');
  AddField('cliente.pagina.cor', 'springgreen');
  AddField('cliente.descricao', 'Dados do cliente');
  AddField('cliente.id', Fields.Values['id']);
  AddField('cliente.nome', Fields.Values['nome']);
  AddField('cliente.rodape',
    '<a href="' + UrlFor(TClienteAction) + '">Voltar</a>');
  ShowContent;
end;

initialization
  TClienteAction.Register('/cliente');

end.
