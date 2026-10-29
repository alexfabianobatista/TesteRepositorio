unit ContFiscY665;

interface

uses Arquivo, Controls, Registro;

type
  TContFiscY665 = class(TRegistro)
  private

  public
    COD_CTA: string; //C
    COD_CCUS: string; //C
    VL_SALDO_SOC: double; //N(19,2)
    IND_VL_SALDO_SOC: string; //C(1)
    VL_SALDO_FIS: double; //N(19,2)
    IND_VL_SALDO_FIS: string; //C(1)
    DIF_SALDOS: double; //N(19,2)
    IND_DIF_SALDOS: string; //C(1)
    MET_CONTR: string; //C(1)
    COD_SUBCONT: string; //C
    COD_CCUS_SUB: string; //C

    procedure grava;
  end;

implementation

uses UFuncoes;

procedure TContFiscY665.grava;
begin
  inherited;
  addCampo(bloco + registro);
  addCampo(COD_CTA);
  addCampo(COD_CCUS);
  addCampo(VL_SALDO_SOC, 2);
  addCampo(IND_VL_SALDO_SOC);
  addCampo(VL_SALDO_FIS, 2);
  addCampo(IND_VL_SALDO_FIS);
  addCampo(DIF_SALDOS, 2);
  addCampo(IND_DIF_SALDOS);
  addCampo(MET_CONTR);
  addCampo(COD_SUBCONT);
  addCampo(COD_CCUS_SUB);
                           
  gravaLinha(arquivoPadrao, TRegistro(self));
  aftergravacao;
end;
end.
