unit UProducaoSementeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFProducaoSementeCad = class(TFTCadSimples)
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    MECampo: TMaskEdit;
    EDNumCampo: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EDQuantidade: TEdit;
    EDCultivar: TEdit;
    EDSafra: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MEDT_I: TMaskEdit;
    MEDT_F: TMaskEdit;
    BTProcurar: TBitBtn;
    MEProduto: TMaskEdit;
    BitBtn2: TBitBtn;
    EDDescProduto: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label10: TLabel;
    Label11: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    EDCadastro: TEdit;
    Label12: TLabel;
    EDNome: TEdit;
    Label13: TLabel;
    RelatriodeProduo1: TMenuItem;
    RelatrioProduoBruta1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure MECampoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure BTProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RelatriodeProduo1Click(Sender: TObject);
    procedure RelatrioProduoBruta1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoSementeCad: TFProducaoSementeCad;

implementation

uses ULaudo_cl, UCampoPlantioCons, UOracle_cl, UCampoPlantio_cl,
  UProdutoCons, UProduto_cl, UProducaoSemente_cl, URProducaoSemente,
  USementeParam, UParamSistema_cl, URProducaoBrutaSementes;

{$R *.DFM}

procedure TFProducaoSementeCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  with DMLaudo do
  begin
    if FCampoPlantioCons = nil then
      FCampoPlantioCons:=TFCampoPlantioCons.Create(Application);
    if FCampoPlantioCons.showmodal = mrOk then
      FProducaoSementeCad.MECampo.Text:=DMCampoPlantio.QCampoPlantioConsCod_Campo_Plantio_Cab.Text;
  end;
  MECampo.SetFocus;
end;

procedure TFProducaoSementeCad.MECampoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECampo.Text) <> '' then
  begin
    EDSafra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA,TB_CAMPO_PLANTIO_CAB T2',
                                     'T2.COD_PLANTIO_SAFRA = TB_PLANTIO_SAFRA.COD_PLANTIO_SAFRA AND '+
                                     'T2.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));

    EDCultivar.Text:=DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO_2 FROM TB_PRODUTO,TB_CAMPO_PLANTIO_CAB T2',
                                   'T2.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND '+
                                   'T2.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));

   // EDQuantidade.Text:=DMOracle.BuscaNome('SELECT TB_PRODUTO.DESC_COMPLEMENTO_2 FROM TB_PRODUTO,TB_CAMPO_PLANTIO_CAB',
   //                              'TB_CAMPO_PLANTIO_CAB.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'+
   //                              'TB_CAMPO_PLANTIO_CAB.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));

    EDNumCampo.Text:=DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.NUM_CAMPO_PLANTIO FROM TB_CAMPO_PLANTIO_CAB',
                                        'TB_CAMPO_PLANTIO_CAB.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));

    EDCadastro.Text:=DMOracle.BuscaNome('SELECT T2.COD_CADASTRO FROM TB_CADASTRO,TB_CAMPO_PLANTIO_CAB T2',
                                   'T2.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND '+
                                   'T2.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));

    EDNome.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO,TB_CAMPO_PLANTIO_CAB T2',
                                   'T2.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO AND '+
                                   'T2.COD_CAMPO_PLANTIO_CAB = '+Trim(MECampo.Text));
  end;
end;

procedure TFProducaoSementeCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with DMCampoPlantio do
  begin
    if FProdutoCons = nil then
      FProdutoCons:= TFProdutoCons.Create(Application);
    if FProdutoCons.ShowModal = mrOk then
      FProducaoSementeCad.MEProduto.Text:=(DMProduto.QProdutoConsCod_Produto.text);
  end;
end;

procedure TFProducaoSementeCad.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
  begin
    EDDescProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(MEProduto.Text));
  end;
end;

procedure TFProducaoSementeCad.BTProcurarClick(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    QProducaoSementeCons.Close;
    QProducaoSementeCons.setVariable('COD_CAMPO',Trim(FProducaoSementeCad.MECampo.Text));
    QProducaoSementeCons.Open;

    QRomaneioCooperanteCons.Close;
    QRomaneioCooperanteCons.setVariable('COD_CADASTRO',Trim(FProducaoSementeCad.EDCadastro.Text));
    QRomaneioCooperanteCons.setVariable('COD_PRODUTO',Trim(FProducaoSementeCad.MEProduto.Text));
    QRomaneioCooperanteCons.setVariable('DATA_I',Trim(FProducaoSementeCad.MEDT_I.Text));
    QRomaneioCooperanteCons.setVariable('DATA_F',Trim(FProducaoSementeCad.MEDT_F.Text));
    QRomaneioCooperanteCons.Open;
  end;

end;

procedure TFProducaoSementeCad.FormActivate(Sender: TObject);
begin
  inherited;
  MECampo.SetFocus;
end;

procedure TFProducaoSementeCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if (Trim(FProducaoSementeCad.MECampo.Text) <> '') then
  begin
    with DMProducaoSemente do
    begin
      // este bloco abre a query de gravacao da producao e coloca em modo de inserção
      QProducaoSemente.Close;
      QProducaoSemente.Open;
      QProducaoSemente.Insert;
      QProducaoSementeCOD_CAMPO_PLANTIO_CAB.Value:=StrToInt(Trim(FProducaoSementeCad.MECampo.Text));
      QProducaoSementeCOD_ROMANEIO_AGRICOLA.Value:=QRomaneioCooperanteConsCod_Romaneio_Agricola.Value;
      QProducaoSemente.post;

      // este bloco abre a consulta dos romaneios pertecente ao campo informado na tela de cadastro
      QProducaoSementeCons.Close;
      QProducaoSementeCons.setVariable('COD_CAMPO',Trim(FProducaoSementeCad.MECampo.Text));
      QProducaoSementeCons.Open;
    end;
  end;
end;

procedure TFProducaoSementeCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with DMProducaoSemente do
  begin
    QProducaoSemente.Close;
    QProducaoSemente.SetVariable('COD_ROMANEIO',QProducaoSementeConsCod_Romaneio_Agricola.Value);
    QProducaoSemente.Open;
    QProducaoSemente.Delete; // deleta o item do produção

    // Este bloco abre a consulta de romaneio pertencente ao campo
    QProducaoSementeCons.Close;
    QProducaoSementeCons.setVariable('COD_CAMPO',Trim(FProducaoSementeCad.MECampo.Text));
    QProducaoSementeCons.Open;
  end;
end;

procedure TFProducaoSementeCad.RelatriodeProduo1Click(Sender: TObject);
begin
  inherited;
  If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[4].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
    if (Trim(FSementeParam.ME5Produto.Text) <> '') and (Trim(FSementeParam.ME5Safra.Text)<>'')then
    begin
      with DMProducaoSemente do
      begin
        QRProducaoSemente.Close;
        QRProducaoSemente.SetVariable('SAFRA',Trim(FSementeParam.ME5Safra.Text));
        QRProducaoSemente.SetVariable('PRODUTO',Trim(FSementeParam.ME5Produto.Text));
        QRProducaoSemente.Open;

        QRProducaoSementeTotal.Close;
        QRProducaoSementeTotal.SetVariable('SAFRA',Trim(FSementeParam.ME5Safra.Text));
        QRProducaoSementeTotal.SetVariable('PRODUTO',Trim(FSementeParam.ME5Produto.Text));
        QRProducaoSementeTotal.Open;
      end;
      if FRProducaoSemente=nil then
         FRProducaoSemente:=TFRProducaoSemente.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' then
        FRProducaoSemente.QRLProdutor.Caption:='A.B.SEMENTES'
      else
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
          FRProducaoSemente.QRLProdutor.Caption:='MOINHO IGUAÇU';
        if FSementeParam.RGPreview.ItemIndex=0 then
         FRProducaoSemente.QRPrimario.Preview
      else
         FRProducaoSemente.QRPrimario.Print;
      DMProducaoSemente.QRProducaoSemente.Close;
    end
    else
      showmessage('Os campos Safra e Cultivar devem ser Preenchidos');
  end;
end;

procedure TFProducaoSementeCad.RelatrioProduoBruta1Click(Sender: TObject);
begin
  inherited;
   If FSementeParam=Nil then
     FSementeParam:=TFSementeParam.Create(Application);
  FSementeParam.PGRelatorio.Pages[5].TabVisible:=True;
  if FSementeParam.ShowModal=MrOk then
  begin
    if (Trim(FSementeParam.ME6Safra.Text)<>'')then
    begin
      with DMProducaoSemente do
      begin
        QRProducaoBrutaSemente.Close;
        QRProducaoBrutaSemente.SetVariable('COD_PLANTIO_SAFRA',Trim(FSementeParam.ME6Safra.Text));
        QRProducaoBrutaSemente.Open;
      end;
      if FRProducaoBrutaSementes=nil then
         FRProducaoBrutaSementes:=TFRProducaoBrutaSementes.Create(Application);
     { if DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' then
        FRProducaoBrutaSemente.QRLProdutor.Caption:='A.B.SEMENTES'
      else
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' then
          FRProducaoSemente.QRLProdutor.Caption:='MOINHO IGUAÇU';}
      FRProducaoBrutaSementes.QRLCidade.Caption:=DMProducaoSemente.QRProducaoBrutaSementeDESC_CIDADE.Value+', '+FormatDateTime(' dd "de" mmmm "de" yyyy',Date);
      FRProducaoBrutaSementes.QRLDTEmissao.Caption:=Trim(FSementeParam.ME6DtEmissao.Text);
      if FSementeParam.RGPreview.ItemIndex=0 then
         FRProducaoBrutaSementes.QRPrimario.Preview
      else
         FRProducaoBrutaSementes.QRPrimario.Print;
      DMProducaoSemente.QRProducaoBrutaSemente.Close;
    end
    else
      showmessage('O campo Safra deve ser Preenchido');
  end;
end;

end.
