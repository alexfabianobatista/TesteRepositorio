unit RegistroG125;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroG125 = Class (TRegistro)
    private
    public
      COD_IND_BEM: String;
      DT_MOV: TDate; //N(8)
      TIPO_MOV: String;
      VL_IMOB_ICMS_OP: Double; //N(X,2)
      VL_IMOB_ICMS_ST: Double; //N(X,2)
      VL_IMOB_ICMS_FRT: Double; //N(X,2)
      VL_IMOB_ICMS_DIF: Double; //N(X,2)
      NUM_PARC: Integer; //3
      VL_PARC_PASS: Double; //N(X,2)


      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroG125 }

procedure TRegistroG125.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_IND_BEM);
  addCampo(DT_MOV, 'D');
  addCampo(TIPO_MOV);
  addCampo(VL_IMOB_ICMS_OP, 2);
  addCampo(VL_IMOB_ICMS_ST, 2);
  addCampo(VL_IMOB_ICMS_FRT, 2);
  addCampo(VL_IMOB_ICMS_DIF, 2);
  addCampo(NUM_PARC, 3);
  addCampo(VL_PARC_PASS, 2);


  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.unit Unit2;

interface

implementation

end.
 