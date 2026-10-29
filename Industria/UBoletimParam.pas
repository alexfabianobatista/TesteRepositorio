unit UBoletimParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask, UFmDepartamento,
  UFmDatas, UFmProduto, UFmLote, UFmFilial, UFmCadastro, UFmSubClasse;

type
  TFBoletimParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    GroupBox15: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    ME1Filial: TMaskEdit;
    Bt1ConsFilial: TBitBtn;
    Ed1Filial: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    Label5: TLabel;
    ME1Turno: TMaskEdit;
    Bt1ConsTurno: TBitBtn;
    Ed1Turno: TEdit;
    TabSheet3: TTabSheet;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    Label8: TLabel;
    ME2Filial: TMaskEdit;
    Bt2ConsFilial: TBitBtn;
    Ed2Filial: TEdit;
    Label9: TLabel;
    ME2Turno: TMaskEdit;
    Bt2ConsTurno: TBitBtn;
    Ed2Turno: TEdit;
    Rg2TipoBoletim: TRadioGroup;
    TabSheet4: TTabSheet;
    Label10: TLabel;
    Me3Filial: TMaskEdit;
    Bt3Filial: TBitBtn;
    Ed3Filial: TEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Me3DataI: TMaskEdit;
    Me3DataF: TMaskEdit;
    Cb0Ordem: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    CB2Ordem: TComboBox;
    Rg1TipoBoletim: TRadioGroup;
    TabSheet5: TTabSheet;
    Label15: TLabel;
    ME4Filial: TMaskEdit;
    Ed4Filial: TEdit;
    Label16: TLabel;
    ME4ClasseInicial: TMaskEdit;
    Ed4ClasseInicial: TEdit;
    Label19: TLabel;
    ME4Produto: TMaskEdit;
    Ed4Produto: TEdit;
    SB4Filial: TSpeedButton;
    SB4ClasseInicial: TSpeedButton;
    SB4Produto: TSpeedButton;
    Label17: TLabel;
    ME4Lote: TMaskEdit;
    SB4Lote: TSpeedButton;
    Ed4Lote: TEdit;
    Fm2Departamento: TFmDepartamento;
    Fm0Departamento: TFmDepartamento;
    TabSheet6: TTabSheet;
    ME5Formula: TMaskEdit;
    Label21: TLabel;
    BitBtn1: TBitBtn;
    ed5Formula: TEdit;
    Fm5Datas: TFmDatas;
    Fm0Produto: TFmProduto;
    Fm0Lote: TFmLote;
    TabSheet7: TTabSheet;
    Fm6Filial: TFmFilial;
    Fm6Produto: TFmProduto;
    Fm6Lote: TFmLote;
    Fm6Datas: TFmDatas;
    TabSheet8: TTabSheet;
    FmFilial7: TFmFilial;
    Label18: TLabel;
    MeFormula7: TMaskEdit;
    BtFormula7: TBitBtn;
    EdFormula7: TEdit;
    TabSheet9: TTabSheet;
    Label20: TLabel;
    MEFilial8: TMaskEdit;
    BtFilial8: TBitBtn;
    EdFilial8: TEdit;
    Label22: TLabel;
    METurno8: TMaskEdit;
    BtTurno8: TBitBtn;
    EdTurno8: TEdit;
    GBEmissao8: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    MeDtInicial8: TMaskEdit;
    MeDtFinal8: TMaskEdit;
    FmProduto1: TFmProduto;
    Label25: TLabel;
    MEFormula: TMaskEdit;
    BtFormula: TBitBtn;
    EdFormula: TEdit;
    TabSheet10: TTabSheet;
    MEOrdem9: TMaskEdit;
    BtOrdem9: TBitBtn;
    EdOrdem9: TEdit;
    Label26: TLabel;
    cbMatPrima: TCheckBox;
    FmEnvasador2: TFmCadastro;
    TabSheet11: TTabSheet;
    Fm10Filial: TFmFilial;
    Fm10Datas: TFmDatas;
    FmSubClasse2: TFmSubClasse;
    FmDepartamento8: TFmDepartamento;
    Fm2Lote: TFmLote;
    FmRotulador2: TFmCadastro;
    TabSheet12: TTabSheet;
    Fm12Filial: TFmFilial;
    Label27: TLabel;
    ME12OrdemProducao: TMaskEdit;
    Btn12OrdemCons: TBitBtn;
    Ed12OrdemProducao: TEdit;
    Fm12Envasador: TFmCadastro;
    Gb12Datas: TGroupBox;
    Label28: TLabel;
    Me12DtInicial: TMaskEdit;
    Label29: TLabel;
    Me12DtFinal: TMaskEdit;
    TabSheet13: TTabSheet;
    Fm13Cadastro: TFmCadastro;
    Fm0SubClasseInicial: TFmSubClasse;
    Fm0SubClasseFinal: TFmSubClasse;
    Fm0ProdutoBI: TFmProduto;
    cbBoletimItem: TCheckBox;
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure Bt1ConsFilialClick(Sender: TObject);
    procedure ME1TurnoExit(Sender: TObject);
    procedure Bt1ConsTurnoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ME2FilialExit(Sender: TObject);
    procedure Bt2ConsFilialClick(Sender: TObject);
    procedure ME2TurnoExit(Sender: TObject);
    procedure Bt2ConsTurnoClick(Sender: TObject);
    procedure Bt3FilialClick(Sender: TObject);
    procedure Me3FilialExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ME4FilialExit(Sender: TObject);
    procedure ME4ClasseInicialExit(Sender: TObject);
    procedure ME4ProdutoExit(Sender: TObject);
    procedure ME4LoteExit(Sender: TObject);
    procedure SB4FilialClick(Sender: TObject);
    procedure SB4ClasseInicialClick(Sender: TObject);
    procedure SB4ProdutoClick(Sender: TObject);
    procedure SB4LoteClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ME5FormulaExit(Sender: TObject);
    procedure BtFormula7Click(Sender: TObject);
    procedure FmFilial7MeFilialExit(Sender: TObject);
    procedure MeFormula7Exit(Sender: TObject);
    procedure MEFilial8Exit(Sender: TObject);
    procedure METurno8Exit(Sender: TObject);
    procedure BtFilial8Click(Sender: TObject);
    procedure BtTurno8Click(Sender: TObject);
    procedure MEFormulaExit(Sender: TObject);
    procedure BtFormulaClick(Sender: TObject);
    procedure BtOrdem9Click(Sender: TObject);
    procedure MEOrdem9Exit(Sender: TObject);
    procedure FmEnvasador2BtCadastroClick(Sender: TObject);
    procedure FmRotulador2BtCadastroClick(Sender: TObject);
    procedure ME12OrdemProducaoExit(Sender: TObject);
    procedure Btn12OrdemConsClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBoletimParam: TFBoletimParam;

implementation

uses UFilialCons, UFilial_cl, UTurno_cl, UTurnoCons, UUsuario_cl,
  UOracle_cl, UProduto_cl, UTipoLote_cl, UProdutoCons, UTipoLoteCons,
  UClasse_cl, UClasseCons, UFormulaCons, UFormula_cl, UBoletimCons,
  UBoletim_cl;

{$R *.DFM}

procedure TFBoletimParam.Bt0ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME0Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0FilialExit(Self);
  End;

end;

procedure TFBoletimParam.ME0FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME0Filial.Text);
    QFilial.Open;
    Ed0Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed0Filial.Text := 'Selecione uma Filial';
end;

procedure TFBoletimParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME1Filial.Text);
    QFilial.Open;
    Ed1Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed1Filial.Text := 'Selecione uma Filial';
end;

procedure TFBoletimParam.Bt1ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1FilialExit(Self);
  End;
end;

procedure TFBoletimParam.ME1TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME1Turno.Text);
    QTurno.Open;
    Ed1Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed1Turno.Text := 'Todos';
end;

procedure TFBoletimParam.Bt1ConsTurnoClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME1Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME1TurnoExit(Self);
  End;

end;

procedure TFBoletimParam.FormCreate(Sender: TObject);
begin
  inherited;
  ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
  ME1Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME1FilialExit(Self);
  ME2Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME2FilialExit(Self);
  ME3Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME3FilialExit(Self);
  ME0DataI.Text := DateToStr(Date-30);
  ME0DataF.Text := DateToStr(Date);
  ME1DataI.Text := DateToStr(Date-30);
  ME1DataF.Text := DateToStr(Date);
  ME2DataI.Text := DateToStr(Date-30);
  ME2DataF.Text := DateToStr(Date);
  ME3DataI.Text := DateToStr(Date-30);
  ME3DataF.Text := DateToStr(Date);
  Cb0Ordem.ItemIndex := 0;
  Cb2Ordem.ItemIndex := 0;

end;

procedure TFBoletimParam.ME2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME2Filial.Text);
    QFilial.Open;
    Ed2Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed2Filial.Text := 'Todas';
end;

procedure TFBoletimParam.Bt2ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;
end;

procedure TFBoletimParam.ME2TurnoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Turno.Text) <> '' Then
  With DMTurno do
  Begin
    QTurno.Close;
    QTurno.SetVariable('PK',ME2Turno.Text);
    QTurno.Open;
    Ed2Turno.Text := QTurnoDesc_Turno.Text;
  End
  Else
    Ed2Turno.Text := 'Todos';
end;

procedure TFBoletimParam.Bt2ConsTurnoClick(Sender: TObject);
begin
  inherited;
  If FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  If FTurnoCons.ShowModal = mrOk then
  Begin
    ME2Turno.Text := DMTurno.QTurnoAllCod_Turno.Text;
    ME2TurnoExit(Self);
  End;
end;

procedure TFBoletimParam.Bt3FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME3Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME3FilialExit(Self);
  End;

end;

procedure TFBoletimParam.Me3FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Filial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',ME3Filial.Text);
    QFilial.Open;
    Ed3Filial.Text := QFilialDesc_Filial.Text;
  End
  Else
    Ed3Filial.Text := 'Selecione uma Filial';

end;

procedure TFBoletimParam.FormActivate(Sender: TObject);
begin
  inherited;
  if trim(ME0Filial.Text) = '' then
    ME0Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  if trim(ME1Filial.Text) = '' then
    ME1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  if trim(ME2Filial.Text) = '' then
    ME2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  if trim(ME3Filial.Text) = '' then
    Me3Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFBoletimParam.ME4FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Filial.Text) <> '' Then
  With DMFilial do
    Ed4Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                          'COD_FILIAL = '+Trim(Me4Filial.Text))
  Else
    Ed4Filial.Text := 'Todas';

end;

procedure TFBoletimParam.ME4ClasseInicialExit(Sender: TObject);
begin
  inherited;
    if Trim(Me4ClasseInicial.Text) <> '' then
  begin
    Ed4ClasseInicial.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Me4ClasseInicial.Text);
     end
  else
  begin
    Ed4ClasseInicial.Text := 'Todas';
  end;
 end;

procedure TFBoletimParam.ME4ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Produto.Text) <> '' Then
  With DMProduto do
    Ed4Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                          'COD_PRODUTO = '+Trim(Me4Produto.Text))
  Else
    Ed4Produto.Text := 'Todos';

end;

procedure TFBoletimParam.ME4LoteExit(Sender: TObject);
begin
  inherited;
If Trim(Me4Lote.Text) <> '' Then
  With DMTipoLote do
    Ed4Lote.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                                          'COD_LOTE_TIPO = '+Trim(Me4Lote.Text))
  Else
    Ed4Lote.Text := 'Todos';
end;

procedure TFBoletimParam.SB4FilialClick(Sender: TObject);
begin
  inherited;
 If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    Me4Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    Me4FilialExit(Self);
     end;

end;

procedure TFBoletimParam.SB4ClasseInicialClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
     FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    Begin
      ME4ClasseInicial.Text:= FloatToStr(DMClasse.QClasseConsNum_Classe.Value);
      Me4ClasseInicialExit(self);
    End;
  end;

procedure TFBoletimParam.SB4ProdutoClick(Sender: TObject);
begin
  inherited;
 If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    Me4Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Me4ProdutoExit(Self);
     end;

end;

procedure TFBoletimParam.SB4LoteClick(Sender: TObject);
begin
  inherited;
If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    Me4Lote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    Me4LoteExit(Self);
     end;

end;

procedure TFBoletimParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FFormulaCons = nil then
     FFormulaCons := TFFormulaCons.Create(Application);
  if FFormulaCons.ShowModal = mrOk then
  begin
      ME5Formula.Text:= FloatToStr(DMFormula.QFormulaConsCOD_FORMULA.Value);
      ME5FormulaExit(self);
  end;
end;

procedure TFBoletimParam.ME5FormulaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME5Formula.Text) <> '' Then
    ed5Formula.Text := DMOracle.FastSelect('DESC_PRODUTO || ' + QuotedStr( ' | ' ) + ' || DESC_LOTE','TB_FORMULA F,'
     + 'TB_PRODUTO P, TB_LOTE_TIPO L','F.COD_PRODUTO = P.COD_PRODUTO AND '
     + 'F.COD_LOTE_TIPO = L.COD_LOTE_TIPO AND COD_FORMULA = ' + Trim(ME5Formula.Text))
  Else
    ed5Formula.Text := 'Todas';
end;

procedure TFBoletimParam.BtFormula7Click(Sender: TObject);
begin
  inherited;
  if FFormulaCons = nil then
     FFormulaCons := TFFormulaCons.Create(Application);
  if FFormulaCons.ShowModal = mrOk then
  begin
      MEFormula7.Text:= FloatToStr(DMFormula.QFormulaConsCOD_FORMULA.Value);
      MEFormula7Exit(self);
  end;
end;

procedure TFBoletimParam.FmFilial7MeFilialExit(Sender: TObject);
begin
  inherited;
  FmFilial7.MeFilialExit(Sender);

end;

procedure TFBoletimParam.MeFormula7Exit(Sender: TObject);
begin
  inherited;
  If Trim(MEFormula7.Text) <> '' Then
    EdFormula7.Text := DMOracle.FastSelect('DESC_PRODUTO || ' + QuotedStr( ' | ' ) + ' || DESC_LOTE','TB_FORMULA F,'
     + 'TB_PRODUTO P, TB_LOTE_TIPO L','F.COD_PRODUTO = P.COD_PRODUTO AND '
     + 'F.COD_LOTE_TIPO = L.COD_LOTE_TIPO AND COD_FORMULA = ' + Trim(MEFormula7.Text))
  Else
    EdFormula7.Text := 'Todas';
end;

procedure TFBoletimParam.MEFilial8Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial8.Text) <> '' Then
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial8.Text);
    QFilial.Open;
    EdFilial8.Text := QFilialDesc_Filial.Text;
  end
  else
    EdFilial8.Text := 'Selecione uma Filial';
end;

procedure TFBoletimParam.METurno8Exit(Sender: TObject);
begin
  inherited;
  if Trim(METurno8.Text) <> '' Then
  with DMTurno do
  begin
    QTurno.Close;
    QTurno.SetVariable('PK',METurno8.Text);
    QTurno.Open;
    EdTurno8.Text := QTurnoDesc_Turno.Text;
  end
  else
    EdTurno8.Text := 'Todos';
end;

procedure TFBoletimParam.BtFilial8Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    MEFilial8.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilial8Exit(Self);
  end;
end;

procedure TFBoletimParam.BtTurno8Click(Sender: TObject);
begin
  inherited;
  if FTurnoCons = Nil then
    FTurnoCons := TFTurnoCons.Create(Application);
  if FTurnoCons.ShowModal = mrOk then
  begin
    METurno8.Text := DMTurno.QTurnoAllCod_Turno.Text;
    METurno8Exit(Self);
  end;
end;

procedure TFBoletimParam.MEFormulaExit(Sender: TObject);
begin
  inherited;
  if trim(MEFormula.Text) <> '' then
  begin
    EdFormula.Text := dmOracle.FastSelect('P.DESC_PRODUTO'
      ,'TB_PRODUTO P INNER JOIN TB_FORMULA F ON P.COD_PRODUTO = F.COD_PRODUTO'
      ,'COD_FORMULA = ' + trim(MEFormula.Text));
  end
  else
    EdFormula.Text := 'Todas';
end;

procedure TFBoletimParam.BtFormulaClick(Sender: TObject);
begin
  inherited;
    if FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  if FFormulaCons.ShowModal = MrOk then
  begin
    MEFormula.Text := DMFormula.QFormulaConsCOD_FORMULA.Text;
    MEFormulaExit(self);
  end;
end;

procedure TFBoletimParam.BtOrdem9Click(Sender: TObject);
begin
  inherited;
  if FBoletimCons = Nil then
    FBoletimCons := TFBoletimCons.Create(Application);
  if FBoletimCons.ShowModal = mrOk then
  begin
    MEOrdem9.Text := DMBoletim.QBoletimConsCod_Boletim.Text;
    MEOrdem9Exit(Self);
  end;

end;

procedure TFBoletimParam.MEOrdem9Exit(Sender: TObject);
begin
  inherited;
  if Trim(MEOrdem9.Text) <> '' Then
  with DMBoletim do
  begin
    QBoletim.Close;
    QBoletim.SetVariable('PK',MEOrdem9.Text);
    QBoletim.Open;
    EdOrdem9.Text := QBoletimNome_formula.Text;
  end
  else
    EdOrdem9.Text := 'Selecione uma Ordem Produção';
end;

procedure TFBoletimParam.FmEnvasador2BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmEnvasador2.BtCadastroClick(Sender);
end;

procedure TFBoletimParam.FmRotulador2BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmRotulador2.BtCadastroClick(Sender);
end;

procedure TFBoletimParam.ME12OrdemProducaoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME12OrdemProducao.Text) <> '' Then
  with DMBoletim do
  begin
    QBoletim.Close;
    QBoletim.SetVariable('PK',ME12OrdemProducao.Text);
    QBoletim.Open;
    ED12OrdemProducao.Text := QBoletimNome_formula.Text;
  end
  else
    Ed12OrdemProducao.Text := 'Todas';
end;

procedure TFBoletimParam.Btn12OrdemConsClick(Sender: TObject);
begin
  inherited;
  if FBoletimCons = Nil then
    FBoletimCons := TFBoletimCons.Create(Application);
  if FBoletimCons.ShowModal = mrOk then
  begin
    Ed12OrdemProducao.Text := DMBoletim.QBoletimConsCod_Boletim.Text;
    ME12OrdemProducao.Text := DMBoletim.QBoletimConsCOD_BOLETIM.Text;
    ME12OrdemProducaoExit(Self);
  end;
end;

end.
