unit UBoletimS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFBoletimEntradaProdAcab = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBGrid1: TDBGrid;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Relao1: TMenuItem;
    ProjeodeGastos1: TMenuItem;
    GastosdeMatPrima1: TMenuItem;
    Produo1: TMenuItem;
    ResumodasPerdas1: TMenuItem;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label8: TLabel;
    EdTurno: TEdit;
    BtnConsTurnoAberto: TBitBtn;
    EdDescTurno: TEdit;
    procedure SBConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure Relao1Click(Sender: TObject);
    procedure ProjeodeGastos1Click(Sender: TObject);
    procedure GastosdeMatPrima1Click(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure ResumodasPerdas1Click(Sender: TObject);
    procedure BtConsTurnoClick(Sender: TObject);
    procedure EdTurnoExit(Sender: TObject);
    procedure BtnConsTurnoAbertoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBoletimEntradaProdAcab: TFBoletimEntradaProdAcab;

implementation

uses UBoletim_cl, UOracle_cl, UTurno_cl, UFilialCons, UFilial_cl,
  UFormulaCons, UFormula_cl, UBoletimCons, UBoletimParam, URBoletim_Relacao,
  UFormulaParam, URFormula_Projecao, URBoletim_ConsMatPrima2,
  URBoletim_ConsMatPrima, URBoletim_Producao, URBoletim_Producao2,
  URBoletim_Perdas, UTurnoConsAberto;

{$R *.DFM}

procedure TFBoletimEntradaProdAcab.SBConfirmarClick(Sender: TObject);
begin
  if Trim(FBoletimEntradaProdAcab.EdTurno.Text) = '' then
  begin
     FBoletimEntradaProdAcab.EdTurno.SetFocus;
     raise exception.create('Turno não pode ficar em branco!');
  end;

  with DMFormula do
  begin
      QFormula.Close;
      QFormula.SetVariable('PK',DMBoletim.QBoletimSCod_Formula.Value);
      QFormula.Open;
      if QFormulaCod_Filial.Value  <> DMBoletim.QBoletimSCod_Filial.Value Then
         raise Exception.Create('Está Formula Não Pode Ser Utilizada Para Esta Filial.');
  end;

  inherited;

  DMBoletim.pGerando := True;
  DMBoletim.QBoletimS.Edit;
  DMBoletim.QBoletimSInd_Tipo_Boletim.Value := 'P';
  DMBoletim.QBoletimSCOD_TURNO_CONTROLE.Value := DMTurno.QTurnoControleAbertoCOD_TURNO_CONTROLE.Value;
  DMBoletim.QBoletimS.Post;
  DMOracle.DBCemapa.Commit;

end;

procedure TFBoletimEntradaProdAcab.FormActivate(Sender: TObject);
begin
  inherited;
  With DMBoletim do
  Begin
    QBoletimS.Open;
    QBoletimItemS.Open;
  End;
  DMTurno.QTurnoAll.Open;

end;

procedure TFBoletimEntradaProdAcab.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QBoletimSCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  End;
end;

procedure TFBoletimEntradaProdAcab.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FFormulaCons = Nil then
    FFormulaCons := TFFormulaCons.Create(Application);
  If FFormulaCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QBoletimSCod_Formula.Value := DMFormula.QFormulaConsCod_Formula.Value;
  End;
end;

procedure TFBoletimEntradaProdAcab.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FBoletimCons = Nil then
    FBoletimCons := TFBoletimCons.Create(Application);
  FBoletimCons.EdTipo_Boletim.Text := 'P';
  If FBoletimCons.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QBoletimS.Close;
    QBoletimS.SetVariable('PK',QBoletimConsCod_Boletim.Value);
    QBoletimS.Open;
  End;
  with DMTurno do
  begin
    QTurno.Close;
    QTurno.SetVariable('PK',DMBoletim.QBoletimConsCOD_TURNO.Value);
    QTurno.Open;
    FBoletimEntradaProdAcab.EdTurno.Text := QTurnoCOD_TURNO.Text;
    FBoletimEntradaProdAcab.EdDescTurno.Text := QTurnoDESC_TURNO.Text;
  end;

end;

procedure TFBoletimEntradaProdAcab.Relao1Click(Sender: TObject);
begin
  inherited;
  If FBoletimParam = Nil then
    FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[2].TabVisible := True;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRRelacao.Close;
    QRRelacao.SetVariable('DATA_I',StrToDate(FBoletimParam.ME2DataI.Text));
    QRRelacao.SetVariable('DATA_F',StrToDate(FBoletimParam.ME2DataF.Text));
    If Trim(FBoletimParam.ME2Filial.Text) = '' then
      QRRelacao.SetVariable('FILIAL',Null)
    Else
      QRRelacao.SetVariable('FILIAL',FBoletimParam.ME2Filial.Text);
    If Trim(FBoletimParam.ME2Turno.Text) = '' then
      QRRelacao.SetVariable('TURNO',Null)
    Else
      QRRelacao.SetVariable('TURNO',FBoletimParam.ME2Turno.Text);
    Case FBoletimParam.Rg2TipoBoletim.ItemIndex of
      0 : QRRelacao.SetVariable('TIPO_BOLETIM','M');
      1 : QRRelacao.SetVariable('TIPO_BOLETIM','P');
    End;
    QRRelacao.SQL[QRRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FBoletimParam.CB2Ordem.ItemIndex of
      0:QRRelacao.SQL.Add('Order By Num_Controle');
      1:QRRelacao.SQL.Add('Order By Cod_Boletim');
      2:QRRelacao.SQL.Add('Order By Dt_Boletim');
    End;
    QRRelacao.Open;
    If FRBoletim_Relacao = Nil then
      FRBoletim_Relacao := TFRBoletim_Relacao.Create(Application);
    FRBoletim_Relacao.QRLTitulo.Caption := 'Boletim de Industrialização de '
                                           +FBoletimParam.ME2DataI.Text
                                           +' até '+FBoletimParam.ME2DataF.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_Relacao.QRPrimario.Preview
    Else
      FRBoletim_Relacao.QRPrimario.Print;
    QRRelacao.Close;
  End;

end;

procedure TFBoletimEntradaProdAcab.ProjeodeGastos1Click(Sender: TObject);
begin
  inherited;
  If FFormulaParam = Nil then
    FFormulaParam := TFFormulaParam.Create(Application);
  FFormulaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FFormulaParam.ShowModal = mrOk then
  With DMFormula do
  Begin
    QRProjecao.Close;
    QRProjecao.SetVariable('PROJECAO',FFormulaParam.ME0Projecao.Text);
    QRProjecao.SetVariable('FILIAL',FFormulaParam.ME0Filial.Text);
    If Trim(FFormulaParam.ME0Formula.Text) = '' then
      QRProjecao.SetVariable('FORMULA',Null)
    Else
      QRProjecao.SetVariable('FORMULA',FFormulaParam.ME0Formula.Text);
    QRProjecao.Open;
    If FRFormula_Projecao = Nil then
      FRFormula_Projecao := TFRFormula_Projecao.Create(Application);
    FRFormula_Projecao.QRLProjecao.Caption := 'Qt. Projetada: '+FormatFloat('###,###,##0.00',StrTofloat(FFormulaParam.ME0Projecao.Text));
    If FFormulaParam.RGPreview.ItemIndex = 0 then
      FRFormula_Projecao.QRPrimario.Preview
    Else
      FRFormula_Projecao.QRPrimario.Print;
    QRProjecao.Close;
  End;
end;

procedure TFBoletimEntradaProdAcab.GastosdeMatPrima1Click(Sender: TObject);
begin
  inherited;
  If FBoletimParam = Nil then
    FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[0].TabVisible := True;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRConsMatPrima.Close;
    QRConsMatPrima.SetVariable('FILIAL',FBoletimParam.ME0Filial.Text);
    //Adicionado os filtros de produto e lote. Junior 02/02/2016. Solicitado pelo César.
    if Trim(FBoletimParam.Fm0Produto.MeProduto.Text) <> '' Then
      QRConsMatPrima.SetVariable('COD_PRODUTO',FBoletimParam.Fm0Produto.MeProduto.Text)
    else
      QRConsMatPrima.SetVariable('COD_PRODUTO', null);
    if Trim(FBoletimParam.Fm0Lote.MeLote.Text) <> '' Then
      QRConsMatPrima.SetVariable('COD_LOTE_TIPO', FBoletimParam.Fm0Lote.MeLote.Text)
    else
      QRConsMatPrima.SetVariable('COD_LOTE_TIPO', null);
    QRConsMatPrima.SetVariable('DATA_I',StrToDate(FBoletimParam.ME0DataI.Text));
    QRConsMatPrima.SetVariable('DATA_F',StrToDate(FBoletimParam.ME0DataF.Text));
    QRConsMatPrima.SQL[QRConsMatPrima.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FBoletimParam.CB0Ordem.ItemIndex of
      0:QRConsMatPrima.SQL.Add(',Tb_produto.DESC_PRODUTO');
      1:QRConsMatPrima.SQL.Add(',Tb_Boletim_Item.COD_PRODUTO');
    End;
    QRConsMatPrima.Open;
    QRConsMatPrima2.Close;
    QRConsMatPrima2.SetVariable('FILIAL',FBoletimParam.ME0Filial.Text);
    //Adicionado os filtros de produto e lote. Junior 02/02/2016. Solicitado pelo César.
    if Trim(FBoletimParam.Fm0Produto.MeProduto.Text) <> '' Then
      QRConsMatPrima2.SetVariable('COD_PRODUTO',FBoletimParam.Fm0Produto.MeProduto.Text)
    else
      QRConsMatPrima2.SetVariable('COD_PRODUTO', null);
    if Trim(FBoletimParam.Fm0Lote.MeLote.Text) <> '' Then
      QRConsMatPrima2.SetVariable('COD_LOTE_TIPO', FBoletimParam.Fm0Lote.MeLote.Text)
    else
      QRConsMatPrima2.SetVariable('COD_LOTE_TIPO', null);
    QRConsMatPrima2.SetVariable('DATA_I',StrToDate(FBoletimParam.ME0DataI.Text));
    QRConsMatPrima2.SetVariable('DATA_F',StrToDate(FBoletimParam.ME0DataF.Text));
    QRConsMatPrima2.SQL[QRConsMatPrima2.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FBoletimParam.CB0Ordem.ItemIndex of
      0:QRConsMatPrima2.SQL.Add('Order By Tb_produto.DESC_PRODUTO');
      1:QRConsMatPrima2.SQL.Add('Order By Tb_Boletim_Item.COD_PRODUTO');
    End;
    QRConsMatPrima2.Open;

    If FRBoletim_ConsMatPrima = Nil then
      FRBoletim_ConsMatPrima := TFRBoletim_ConsMatPrima.Create(Application);
    FRBoletim_ConsMatPrima.QRLTitulo.Caption := 'Gastos de Mat. Prima de '+FBoletimParam.ME0DataI.Text + ' até '+FBoletimParam.ME0DataF.Text;
    If FRBoletim_ConsMatPrima2 = Nil then
      FRBoletim_ConsMatPrima2 := TFRBoletim_ConsMatPrima2.Create(Application);
    FRBoletim_ConsMatPrima2.QRLTitulo.Caption := 'Gastos de Mat. Prima de '+FBoletimParam.ME0DataI.Text + ' até '+FBoletimParam.ME0DataF.Text;

    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_ConsMatPrima.QRCompositeReport1.Preview
    Else
      FRBoletim_ConsMatPrima.QRCompositeReport1.Print;
    QRConsMatPrima.Close;
  End;
end;

procedure TFBoletimEntradaProdAcab.Produo1Click(Sender: TObject);
begin
  inherited;
  If FBoletimParam = Nil then
     FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[1].TabVisible := True;
  FBoletimParam.Rg1TipoBoletim.Visible := False;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRProducao.Close;
    QRProducao2.Close;
    QRProducao.SetVariable('FILIAL',FBoletimParam.ME1Filial.Text);
    QRProducao.SetVariable('DATA_I',StrToDate(FBoletimParam.ME1DataI.Text));
    QRProducao.SetVariable('DATA_F',StrToDate(FBoletimParam.ME1DataF.Text));
    If Trim(FBoletimParam.ME1Turno.Text) = '' Then
    Begin
      QRProducao.SetVariable('TURNO',Null);
      QRProducao2.SetVariable('TURNO',Null);
    end
    Else
    Begin
      QRProducao.SetVariable('TURNO',FBoletimParam.ME1Turno.Text);
      QRProducao2.SetVariable('TURNO',FBoletimParam.ME1Turno.Text);
    End;
    QRProducao.SetVariable('TIPO_BOLETIM','P');
    QRProducao2.SetVariable('TIPO_BOLETIM','P');
    QRProducao.Open;
    QRProducao2.SetVariable('FILIAL',FBoletimParam.ME1Filial.Text);
    QRProducao2.SetVariable('DATA_I',StrToDate(FBoletimParam.ME1DataI.Text));
    QRProducao2.SetVariable('DATA_F',StrToDate(FBoletimParam.ME1DataF.Text));
    QRProducao2.Open;

    If FRBoletim_Producao = Nil then
       FRBoletim_Producao := TFRBoletim_Producao.Create(Application);
    If FRBoletim_Producao2 = Nil then
       FRBoletim_Producao2 := TFRBoletim_Producao2.Create(Application);
    FRBoletim_Producao.QRLTitulo.Caption := 'Rel. da Producao de '+FBoletimParam.ME0DataI.Text + ' até '+FBoletimParam.ME1DataF.Text;
    FRBoletim_Producao2.QRLTitulo.Caption := 'Rel. da Producao de  '+FBoletimParam.ME0DataI.Text + ' até '+FBoletimParam.ME1DataF.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_Producao.QRCompositeReport1.Preview
    Else
      FRBoletim_Producao.QRCompositeReport1.Print;
    QRProducao.Close;
    QRProducao2.Close;
  End;
  FBoletimParam.Rg1TipoBoletim.Visible := True;
End;

procedure TFBoletimEntradaProdAcab.ResumodasPerdas1Click(Sender: TObject);
begin
  inherited;
  If FBoletimParam = Nil then
    FBoletimParam := TFBoletimParam.Create(Application);
  FBoletimParam.PGRelatorio.Pages[3].TabVisible := True;
  If FBoletimParam.ShowModal = mrOk then
  With DMBoletim do
  Begin
    QRPerdas.Close;
    QRPerdas.SetVariable('DATA_I',StrToDate(FBoletimParam.ME3DataI.Text));
    QRPerdas.SetVariable('DATA_F',StrToDate(FBoletimParam.ME3DataF.Text));
    If Trim(FBoletimParam.ME3Filial.Text) = '' then
      QRPerdas.SetVariable('FILIAL',Null)
    Else
      QRPerdas.SetVariable('FILIAL',FBoletimParam.ME3Filial.Text);
    QRPerdas.Open;
    If FRBoletim_Perdas = Nil then
      FRBoletim_Perdas := TFRBoletim_Perdas.Create(Application);
    FRBoletim_Perdas.QRLTitulo.Caption := 'Resumo das Perdas no Periodo '
                                           +FBoletimParam.ME3DataI.Text
                                           +' até '+FBoletimParam.ME3DataF.Text;
    If FBoletimParam.RGPreview.ItemIndex = 0 then
      FRBoletim_Perdas.QRPrimario.Preview
    Else
      FRBoletim_Perdas.QRPrimario.Print;
    QRPerdas.Close;
  End;

end;

procedure TFBoletimEntradaProdAcab.BtConsTurnoClick(Sender: TObject);
begin
  inherited;
  if FTurnoConsAberto = Nil then
    FTurnoConsAberto := TFTurnoConsAberto.Create(Application);

  with DMTurno do
  begin
     QTurnoControleAberto.close;
     QTurnoControleAberto.Open;
  end;

  if FTurnoConsAberto.ShowModal = mrOk then
  begin
    DMBoletim.QBoletimSCOD_TURNO_CONTROLE.Value := DMTurno.QTurnoControleAbertoCOD_TURNO_CONTROLE.Value;
    FBoletimEntradaProdAcab.EdTurno.Text := FloatToStr(DMTurno.QTurnoControleAbertoCod_Turno.Value);
    FBoletimEntradaProdAcab.EdTurno.Text := DMTurno.QTurnoControleAbertoDESC_TURNO.Value;
  end;

end;

procedure TFBoletimEntradaProdAcab.EdTurnoExit(Sender: TObject);
begin
  inherited;
  if FBoletimEntradaProdAcab.EdTurno.Text = '' then
     raise exception.Create('Código do Turno não pode ficar em branco!')
  else
     with DMTurno do
     begin
       QTurnoControleAberto.Close;
       QTurnoControleAberto.SetVariable('PK',FBoletimEntradaProdAcab.EdTurno.Text);
       QTurnoControleAberto.Open;

       if QTurnoControleAberto.Eof then
          raise Exception.Create('Turno fechado e/ou não encontrado!')
       else
          FBoletimEntradaProdAcab.EdDescTurno.Text := QTurnoControleAbertoDESC_TURNO.Value
     end;

end;

procedure TFBoletimEntradaProdAcab.BtnConsTurnoAbertoClick(Sender: TObject);
begin
  inherited;
  if FTurnoConsAberto = Nil then
     FTurnoConsAberto := TFTurnoConsAberto.Create(Application);

  with DMTurno do
  begin
    QTurnoControleAberto.close;
    QTurnoControleAberto.SetVariable('PK',Null);
    QTurnoControleAberto.Open;
  end;

  if FTurnoConsAberto.ShowModal = mrOk then
  begin
    FBoletimEntradaProdAcab.EdTurno.Text := FloatToStr(DMTurno.QTurnoControleAbertoCod_Turno.Value);
    FBoletimEntradaProdAcab.EdDescTurno.Text := DMTurno.QTurnoControleAbertoDESC_TURNO.Value;
  end;

end;

procedure TFBoletimEntradaProdAcab.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DsPrimario.State in [dsInsert] then
  begin
    FBoletimEntradaProdAcab.EdTurno.Text := '';
    FBoletimEntradaProdAcab.EdDescTurno.Text := '';
  end;
end;

procedure TFBoletimEntradaProdAcab.SBIncluirClick(Sender: TObject);
begin
  inherited;
  FBoletimEntradaProdAcab.EdTurno.SetFocus;
end;

procedure TFBoletimEntradaProdAcab.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (18);
end;

end.
