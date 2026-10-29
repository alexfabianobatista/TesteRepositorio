unit RegistroD400;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroD400 = Class (TRegistro)
    private
    public
      COD_PART: String; //C
      COD_MOD: String; //C(2)
      COD_SIT: Integer; //N(2)
      SER: String; //C
      SUB: Integer; //N
      NUM_DOC: Integer; //N
      DT_DOC: TDate; //N(8)
      VL_DOC: Double; //N(X,2)
      VL_DESC: Double; //N(X,2)
      VL_SERV: Double; //N(X,2)
      VL_BC_ICMS: Double; //N(X,2)
      VL_ICMS: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroD400 }

procedure TRegistroD400.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_PART);
  addCampo(COD_MOD, 2);
  addCampo(COD_SIT, 2);
  addCampo(SER);
  addCampo(SUB, 0);
  addCampo(NUM_DOC, 0);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_DESC, 2);
  addCampo(VL_SERV, 2);
  addCampo(VL_BC_ICMS, 2);
  addCampo(VL_ICMS, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
