unit PisCofinsA100;

interface

uses Arquivo, Registro, Controls;

type
  TPisCofinsA100 = class(TRegistro)
  private
  public
    IND_OPER: Integer; //C(1)
    IND_EMIT: Integer; //C(1)
    COD_PART: string; //C(60)
    COD_SIT: Integer; //N(2)
    SER: Integer; //N(20)
    SUB: Integer; //N(20)
    NUM_DOC: string; //C(60)
    CHV_NFSE: string; //N(60)
    DT_DOC: TDate; //N(8)
    DT_EXE_SERV: TDate; //N(8)
    VL_DOC: Double; //N(X,2)
    IND_PGTO: Integer; //C(1)
    VL_DESC: Double; //N(X,2)
    VL_BC_PIS: Double; //N(X,2)
    VL_PIS: Double; //N(X,2)
    VL_BC_COFINS: Double; //N(X,2)
    VL_COFINS: Double; //N(X,2)
    VL_PIS_RET: Double; //N(X,2)
    VL_COFINS_RET: Double; //N(X,2)
    VL_ISS: Double; //N(X,2)

    procedure grava;
  end;

implementation

uses UFuncoes;

{ TRegistro0001 }

procedure TPisCofinsA100.grava;
begin
  inherited;

  addCampo(bloco + registro);

  addCampo(IND_OPER, 1);
  addCampo(IND_EMIT, 1);
  addCampo(COD_PART, 60);
  addCampo(COD_SIT, 2);
  addCampo(SER, 20);
  addCampo(SUB, 20);
  addCampo(NUM_DOC, 60);

  if COD_SIT =  0 then
  begin
    addCampo(CHV_NFSE, 60);
    addCampo(DT_DOC, 'D');
    addCampo(DT_EXE_SERV, 'D');
    addCampo(VL_DOC, 2);
    addCampo(IND_PGTO, 1);
    addCampo(VL_DESC, 2);
    addCampo(VL_BC_PIS, 2);
    addCampo(VL_PIS, 2);
    addCampo(VL_BC_COFINS, 2);
    addCampo(VL_COFINS, 2);
    addCampo(VL_PIS_RET, 2);
    addCampo(VL_COFINS_RET, 2);
    addCampo(VL_ISS, 2);
  end
  else
    if COD_SIT = 2 then
    begin
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
      addCampo('');
    end;
  gravaLinha(arquivoPadrao, TRegistro(Self));
  afterGravacao;
end;

end.

