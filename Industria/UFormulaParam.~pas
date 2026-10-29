unit UFormulaParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmClasse,
  UFmProduto, UFmFilial, UFmSubClasse;

type
  TFFormulaParam = class(TFTParametro)
    TSProjecao: TTabSheet;
    Label19: TLabel;
    ME0Formula: TMaskEdit;
    Bt0ConsFormula: TBitBtn;
    Ed0Formula: TEdit;
    Label1: TLabel;
    ME0Filial: TMaskEdit;
    Bt0ConsFilial: TBitBtn;
    Ed0Filial: TEdit;
    ME0Projecao: TMaskEdit;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    ME1Formula: TMaskEdit;
    Bt1Consformula: TBitBtn;
    Ed1Formula: TEdit;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Me2Formula: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed2Formula: TEdit;
    Me2Filial: TMaskEdit;
    Label5: TLabel;
    BitBtn2: TBitBtn;
    Ed2Filial: TEdit;
    Label6: TLabel;
    Me2LoteTipo: TMaskEdit;
    Bt2LoteTipo: TBitBtn;
    Ed2LoteTipo: TEdit;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ME4Ordem: TMaskEdit;
    SB4Ordem: TSpeedButton;
    Ed4Classe: TEdit;
    Label9: TLabel;
    Me4Classe: TMaskEdit;
    SB4Classe: TSpeedButton;
    Label10: TLabel;
    CB4Data: TCheckBox;
    RG4Tipo: TRadioGroup;
    FmClasse1: TFmClasse;
    GB3Periodo: TGroupBox;
    ME3DtInicial: TMaskEdit;
    ME3DtFinal: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    TabSheet5: TTabSheet;
    FmProduto5: TFmProduto;
    FmFilial5: TFmFilial;
    Fm0SubClasse: TFmSubClasse;
    RGTipoRelatorio: TRadioGroup;
    TabSheet6: TTabSheet;
    FmFilial6: TFmFilial;
    FmProduto6: TFmProduto;
    TabSheet7: TTabSheet;
    Fm7Filial: TFmFilial;
    Bt7Formula1: TBitBtn;
    Me7Formula1: TMaskEdit;
    Label11: TLabel;
    Me7Projecao1: TMaskEdit;
    Label13: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Me7Projecao2: TMaskEdit;
    Me7Projecao3: TMaskEdit;
    Me7Projecao4: TMaskEdit;
    Me7Projecao5: TMaskEdit;
    Me7Projecao6: TMaskEdit;
    Me7Projecao7: TMaskEdit;
    Me7Projecao8: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Me7Formula2: TMaskEdit;
    Me7Formula3: TMaskEdit;
    Me7Formula4: TMaskEdit;
    Me7Formula5: TMaskEdit;
    Me7Formula6: TMaskEdit;
    Me7Formula7: TMaskEdit;
    Me7Formula8: TMaskEdit;
    Bt7Formula5: TBitBtn;
    Bt7Formula6: TBitBtn;
    Bt7Formula2: TBitBtn;
    Bt7Formula3: TBitBtn;
    Bt7Formula7: TBitBtn;
    Bt7Formula8: TBitBtn;
    Bt7Formula4: TBitBtn;
    CbSituacao5: TComboBox;
    Label30: TLabel;
    CbSituacao1: TComboBox;
    Label31: TLabel;
    procedure Bt0ConsFormulaClick(Sender: TObject);
    procedure ME0FormulaExit(Sender: TObject);
    procedure Bt0ConsFilialClick(Sender: TObject);
    procedure ME0FilialExit(Sender: TObject);
    procedure Bt1ConsformulaClick(Sender: TObject);
    procedure ME1FormulaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure Me2FormulaExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Me2LoteTipoExit(Sender: TObject);
    procedure Bt2LoteTipoClick(Sender: TObject);
    procedure SB4OrdemClick(Sender: TObject);
    procedure SB4ClasseClick(Sender: TObject);
    procedure Me4ClasseExit(Sender: TObject);
    procedure Bt7Formula1Click(Sender: TObject);
    procedure TabSheet7Show(Sender: TObject);
    procedure Bt7Formula2Click(Sender: TObject);
    procedure Bt7Formula3Click(Sender: TObject);
    procedure Bt7Formula4Click(Sender: TObject);
    procedure Bt7Formula5Click(Sender: TObject);
    procedure Bt7Formula6Click(Sender: TObject);
    procedure Bt7Formula7Click(Sender: TObject);
    procedure Bt7Formula8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormulaParam: TFFormulaParam;

implementation

uses UFormulaCons, UFormula_cl, UFilialCons, UFilial_cl, UUsuario_cl,
  UOracle_cl, UTipoLoteCons, UTipoLote_cl, UOrdemProducaoCons,
  UOrdemProducao_cl, UClasseCons, UClasse_cl;

{$R *.DFM}

procedure TFFormulaParam.Bt0ConsFormulaClick(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  Begin
    ME0Formula.Text := DMFormula.QFormulaConsCod_Formula.Text;
    ME0FormulaExit(Self);
  End;
end;

procedure TFFormulaParam.ME0FormulaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Formula.Text) <> '' Then
  With DMFormula do
  Begin
    QFormula.Close;
    QFormula.SetVariable('PK',ME0Formula.Text);
    QFormula.Open;
    Ed0Formula.Text := QFormulaNome_produto.Text;
  End
  Else
    Ed0Formula.Text := 'Todos';
end;

procedure TFFormulaParam.Bt0ConsFilialClick(Sender: TObject);
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

procedure TFFormulaParam.ME0FilialExit(Sender: TObject);
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
    Ed0Filial.Text := 'Todas';
end;

procedure TFFormulaParam.Bt1ConsformulaClick(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  Begin
    ME1Formula.Text := DMFormula.QFormulaConsCod_Formula.Text;
    ME1FormulaExit(Self);
  End;
end;

procedure TFFormulaParam.ME1FormulaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Formula.Text) <> '' Then
  With DMFormula do
  Begin
    QFormula.Close;
    QFormula.SetVariable('PK',ME1Formula.Text);
    QFormula.Open;
    Ed1Formula.Text := QFormulaNome_produto.Text;
  End
  Else
    Ed1Formula.Text := 'Todos';
end;

procedure TFFormulaParam.FormCreate(Sender: TObject);
begin
  inherited;
  //ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  ME0FilialExit(Self);
end;

procedure TFFormulaParam.BtOkClick(Sender: TObject);
begin
  inherited;
  If PGRelatorio.ActivePage = TSProjecao Then
  Begin
    If Trim(ME0Projecao.Text) = '' Then
    Begin
      ModalResult := mrNone;
      Raise Exception.Create('Quantidade a projetar não informada!');
    End;
  End;
end;

procedure TFFormulaParam.Me2FormulaExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Formula.Text) <> '' Then
  With DMFormula do
  Begin
    QFormula.Close;
    QFormula.SetVariable('PK',ME2Formula.Text);
    QFormula.Open;
    Ed2Formula.Text := QFormulaNome_produto.Text;
  End
  Else
    Ed2Formula.Text := 'Todos';

end;

procedure TFFormulaParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  Begin
    ME2Formula.Text := DMFormula.QFormulaConsCod_Formula.Text;
    ME2FormulaExit(Self);
  End;

end;

procedure TFFormulaParam.Me2FilialExit(Sender: TObject);
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
    Ed2Filial.Text := 'Selecione uma filial';

end;

procedure TFFormulaParam.BitBtn2Click(Sender: TObject);
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

procedure TFFormulaParam.FormActivate(Sender: TObject);
begin
  inherited;
//ME0Filial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  Me2Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFFormulaParam.Me2LoteTipoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me2LoteTipo.Text) <> '' Then
    Ed2LoteTipo.Text := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                         'COD_LOTE_TIPO = '+Trim(Me2LoteTipo.Text))
  Else
    Ed2LoteTipo.Text := 'Todos';
end;

procedure TFFormulaParam.Bt2LoteTipoClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    ME2LoteTipo.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;
    Me2LoteTipoExit(Self);
  End;

end;

procedure TFFormulaParam.SB4OrdemClick(Sender: TObject);
begin
  inherited;
  If FOrdemProducaoCons = Nil then
    FOrdemProducaoCons := TFOrdemProducaoCons.Create(Application);
  If FOrdemProducaoCons.ShowModal = mrOk then
    ME4Ordem.Text := IntToStr(DMOrdemProducao.QOrdemProducaoConsCOD_ORDEM_PRODUCAO_CAB.Value);
end;

procedure TFFormulaParam.SB4ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME4Classe.Text := IntToStr(DMClasse.QClasseConsNum_Classe.Value);
end;

procedure TFFormulaParam.Me4ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Classe.Text) <> '' Then
    Ed4Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                         'COD_CLASSE = '+Trim(Me4Classe.Text))
  Else
    Ed4Classe.Text := 'Todos';
end;

procedure TFFormulaParam.Bt7Formula1Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula1.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.TabSheet7Show(Sender: TObject);
begin
  inherited;
  Fm7Filial.MeFilial.Text := '1';
end;

procedure TFFormulaParam.Bt7Formula2Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula2.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula3Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula3.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula4Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula4.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula5Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula5.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula6Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula6.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula7Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula7.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

procedure TFFormulaParam.Bt7Formula8Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
    Me7Formula8.Text := DMFormula.QFormulaConsCod_Formula.Text;
end;

end.
