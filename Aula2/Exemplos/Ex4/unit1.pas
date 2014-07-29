unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  BrookAction;

type

  {TCliente}

  TCliente = class(TObject)
  private
    FId    :Integer;
    FNome  :String;

  published
    property Id   :Integer read FId write FId;
    property Nome :String read FNome write FNome;
  end;

  {TMyAction}

  TMyAction = class(specialize TBrookGAction<TCliente>)
  public
    procedure Get; override;
  end;

implementation

procedure TMyAction.Get;
begin
 Entity.Id:=100;
 Entity.Nome:='Fulano de tal e cicrano';
 Write(Entity);

end;

initialization
  TMyAction.Register('*');

end.
