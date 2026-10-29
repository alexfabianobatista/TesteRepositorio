unit Registro9001;

interface

uses Arquivo, Registro, Controls;

type
  TFiscal9001 = Class (TRegistro)
    private
    public
      IND_MOV: Integer; //N(1)

      procedure grava;
    end;

  TContabil9001 = Class (TRegistro)
    private
    public
      IND_DAD: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro9001 }

procedure TFiscal9001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

procedure TContabil9001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
