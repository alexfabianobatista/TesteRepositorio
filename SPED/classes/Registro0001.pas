unit Registro0001;

interface

uses Arquivo, Registro, Controls;

type
  TFiscal0001 = Class (TRegistro)
    private
    public
      IND_MOV: Integer; //N(1)

      procedure grava;
    end;

  TContabil0001 = Class (TRegistro)
    private
    public
      IND_DAD: Integer; //N(1)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TFiscal0001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_MOV, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

procedure TContabil0001.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(IND_DAD, 1);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
