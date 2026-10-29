unit RegistroC179;

interface

uses Arquivo, Registro, Controls;

type
  TRegistroC179 = Class (TRegistro)
    private
    public
      BC_ST_ORIG_DEST: Double; //N(X,2)
      ICMS_ST_REP: Double; //N(X,2)
      ICMS_ST_COMPL: Double; //N(X,2)
      BC_RET: Double; //N(X,2)
      ICMS_RET: Double; //N(X,2)

      procedure grava;
    end;

implementation

uses UFuncoes;

{ TRegistroC179 }

procedure TRegistroC179.grava;
begin
  inherited;

  addCampo(bloco + registro);
  addCampo(BC_ST_ORIG_DEST, 2);
  addCampo(ICMS_ST_REP, 2);
  addCampo(ICMS_ST_COMPL, 2);
  addCampo(BC_ST_ORIG_DEST, 2);
  addCampo(ICMS_RET, 2);
  gravaLinha(arquivoPadrao, TRegistro(Self));
afterGravacao;
end;

end.
