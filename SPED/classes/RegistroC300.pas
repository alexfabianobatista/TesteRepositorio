unit RegistroC300;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC300 = Class (TRegistro)
    private
    public
      COD_MOD: String; //C(2)
      SER: String; //C
      SUB: String; //C
      NUM_DOC_INI: Integer; //N
      NUM_DOC_FIN: Integer; //N
      DT_DOC: TDate; //N(8)
      VL_DOC: Double; //N(X,2)
      VL_PIS: Double; //N(X,2)
      VL_COFINS: Double; //N(X,2)
      COD_CTA: String; //C

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC300 }

procedure TRegistroC300.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(COD_MOD, 2);
  addCampo(SER);
  addCampo(SUB);
  addCampo(NUM_DOC_INI, 0);
  addCampo(NUM_DOC_FIN, 0);
  addCampo(DT_DOC, 'D');
  addCampo(VL_DOC, 2);
  addCampo(VL_PIS, 2);
  addCampo(VL_COFINS, 2);
  addCampo(COD_CTA);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end. 
