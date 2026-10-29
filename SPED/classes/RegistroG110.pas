unit RegistroG110;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG110 = Class (TRegistro)
    private
    public
      DT_INI: TDate; //N(8)
      DT_FIN: TDate; //N(8)
      SALDO_IN_ICMS: Double; //N(X,2)
      SOM_PARC: Double; //N(X,2)
      VL_TRIB_EXP: Double; //N(X,2)
      VL_TOTAL: Double; //N(X,2)
      IND_PER_SAI: Double; //N(X,2)
      CMS_APROP: Double; //N(X,2)
      SOM_ICMS_OC: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG110 }

procedure TRegistroG110.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(DT_INI, 'D');
  addCampo(DT_FIN, 'D');
  addCampo(SALDO_IN_ICMS, 2);
  addCampo(SOM_PARC, 2);
  addCampo(VL_TRIB_EXP, 2);
  addCampo(VL_TOTAL, 2);
  addCampo(IND_PER_SAI, 8);
  addCampo(CMS_APROP, 2);
  addCampo(SOM_ICMS_OC, 2);

  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.
