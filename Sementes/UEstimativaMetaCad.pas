unit UEstimativaMetaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Mask, ExtCtrls, Menus, ActiveX, ComObj;

type
  TFEstimativaMetaCad = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MECod_Safra: TMaskEdit;
    BitBtn1: TBitBtn;
    MEDesc_Safra: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MEDesc_Cultura: TMaskEdit;
    MEClasse_Plantio: TMaskEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    BTConfirmar: TBitBtn;
    BTCancelar: TBitBtn;
    BTExcluir: TBitBtn;
    BTSair: TBitBtn;
    MainMenu1: TMainMenu;
    Relatrios1: TMenuItem;
    RelatrioDadosGerais1: TMenuItem;
    BTEditar: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    function  GetOrCreateObject(const ClassName: string): IDispatch;
    procedure MECod_SafraExit(Sender: TObject);
    procedure BTCancelarClick(Sender: TObject);
    procedure BTExcluirClick(Sender: TObject);
    procedure RelatrioDadosGerais1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BTEditarClick(Sender: TObject);
    procedure BTConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstimativaMetaCad: TFEstimativaMetaCad;
  newWord : Variant;

implementation

uses UEstimativaMeta_cl, UPlantioSafra_cl, UOracle_cl, USementeParam,
  UParamSistema_cl, UPlantioSafraCons, UBiblioteca;

{$R *.DFM}

function FormataTextoDir(wString: String; wTamanho: integer): String;
var
  Texto,Txt:String;
  i:integer;
begin
  Texto:=Trim(wString);
  Txt:='';
  if Length(Texto)< wTamanho then
    begin
      for i:=1 to wTamanho-Length(Texto) do
        Txt:=' '+Txt;
      Result:=Txt+Texto;
    end
  else
    if Length(Texto)>= wTamanho then
       Result:=Copy(Texto,1,wTamanho);
end;

function TFEstimativaMetaCad.GetOrCreateObject(const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID (ClassName);
  if Succeeded (GetActiveObject (ClassID, nil, Unknown)) then
     OleCheck(Unknown.QueryInterface (IDispatch, Result))
  else
     Result := CreateOleObject (ClassName);
end;

procedure TFEstimativaMetaCad.BitBtn2Click(Sender: TObject);
begin
  if MECod_Safra.Text <> '' then
  begin
    with DMEstimativaMeta do
    begin
      QBuscaCultivar.Close;
      QBuscaCultivar.SetVariable('COD_PLANTIO_SAFRA',Trim(MECod_Safra.Text));
      QBuscaCultivar.Open;
      QBuscaCultivar.First;
      while Not(QBuscaCultivar.Eof) do
      begin
        QEstimativaMeta.Insert;
        QEstimativaMetaCod_Produto.Text:=QBuscaCultivarCod_Produto.Text;
        QEstimativaMetaCod_Plantio_Safra.Value:=QBuscaCultivarCod_Plantio_Safra.Value;
        QEstimativaMetaVal_Estimativa.Value:=StrToFloat(inputBox('Cadastro Estimativa/Meta','Valor Estimativa: '+QBuscaCultivarDesc_Complemento_2.Value,''));
        QEstimativaMetaVal_Meta.Value:=StrToFloat(inputBox('Cadastro Estimativa/Meta','Valor Meta:'+QBuscaCultivarDesc_Complemento_2.Value,''));
        QEstimativaMeta.Post;
        QBuscaCultivar.next;
      end;
    end;
  end;
end;

procedure TFEstimativaMetaCad.MECod_SafraExit(Sender: TObject);
begin
  if Trim(MECod_Safra.Text) <> '' then
  begin
    with DMPlantioSafra do
    begin
      QPlantioSafra.Close;
      QPlantioSafra.SetVariable('PK',Trim(MeCod_Safra.Text));
      QPlantioSafra.Open;
      MEDesc_Safra.Text:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA','COD_PLANTIO_SAFRA='+Trim(MeCod_Safra.Text));
      MEDesc_Cultura.Text:=DMOracle.BuscaNome('SELECT DESC_CULTURA FROM TB_CULTURA','COD_CULTURA='+QPlantioSafraCod_Cultura.Text);
      MEClasse_Plantio.Text:=DMOracle.BuscaNome('SELECT DESC_CLASSE_PLANTIO FROM TB_CLASSE_PLANTIO','COD_CLASSE_PLANTIO='+QPlantioSafraCod_Classe_Plantio.Text);
      with DMEstimativaMeta do
      begin
        QEstimativaMeta.Close;
        QEstimativaMeta.SetVariable('COD_PLANTIO_SAFRA',Trim(MECod_Safra.Text));
        QEstimativaMeta.Open;
        QVerificaAlteracao.Close;
        QVerificaAlteracao.SetVariable('COD_PLANTIO_SAFRA',Trim(MECod_Safra.Text));
        QVerificaAlteracao.Open;
        QVerificaAlteracao.First;
        if QEstimativaMeta.RecordCount <> 0 then
        begin
          while Not(QVerificaAlteracao.Eof) do
          begin
            QEstimativaMeta.Insert;
            QEstimativaMetaCod_Produto.Text:=QVerificaAlteracaoCod_Produto.Text;
            QEstimativaMetaCod_Plantio_Safra.Value:=StrToInt(Trim(MECod_Safra.Text));
            QEstimativaMetaVal_Estimativa.Value:=StrToFloat(inputBox('Cadastro Estimativa/Meta','Valor Estimativa: '+(DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_PRODUTO,TB_CAMPO_PLANTIO_CAB','TB_CAMPO_PLANTIO_CAB.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND TB_PRODUTO.COD_PRODUTO='+QVerificaAlteracaoCod_Produto.Text)),''));
            QEstimativaMetaVal_Meta.Value:=StrToFloat(inputBox('Cadastro Estimativa/Meta','Valor Meta:'+(DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_PRODUTO,TB_CAMPO_PLANTIO_CAB','TB_CAMPO_PLANTIO_CAB.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND TB_PRODUTO.COD_PRODUTO = '+QVerificaAlteracaoCod_Produto.Text)),''));
            QEstimativaMeta.Post;
            QVerificaAlteracao.next;
          end;
        end;
      end;
    end;
  end;
end;


procedure TFEstimativaMetaCad.BTCancelarClick(Sender: TObject);
var
  wComando:String;
begin
  Try
    DMOracle.DBCemapa.StartTransaction;
    if MECod_Safra.Text <> '' then
    begin
      with DMOracle do
      begin
        wComando:=('DELETE FROM TB_ESTIMATIVA_META WHERE COD_PLANTIO_SAFRA = '+Trim(MeCod_Safra.Text));
        QExecSql.Close;
        QExecSql.SQL.Clear;
        QExecSql.SQL.add(wComando);
        QExecSql.ExecSQL;
    end;
  end;
  DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    raise exception.Create('Erro ao tentar excluir os dados');
  end;
  MECod_SafraExit(self);
end;

procedure TFEstimativaMetaCad.BTExcluirClick(Sender: TObject);
begin
  DMEstimativaMeta.QEstimativaMeta.Delete;
end;

procedure TFEstimativaMetaCad.RelatrioDadosGerais1Click(Sender: TObject);
var
  wCont:Integer;
  Document, Range, Table :Variant;
  wEstimativaTotal,wMetaTotal,wAreaTotal,wTotal:Real;
begin
  wEstimativaTotal:=0;
  wMetaTotal:=0;
  wAreaTotal:=0;
  wTotal:=0;
  if FEstimativaMetaCad.MECod_Safra.Text <> '' then
  begin
    with DMEstimativaMeta do
    begin
      QRDadosGeraisCidade.Close;
      QRDadosGeraisCidade.SetVariable('COD_PLANTIO_SAFRA',Trim(FEstimativaMetaCad.MECod_Safra.Text));
      QRDadosGeraisCidade.Open;
      QRDadosGeraisProduto.Close;
      QRDadosGeraisProduto.SetVariable('COD_PLANTIO_SAFRA',Trim(FEstimativaMetaCad.MECod_Safra.Text));
      QRDadosGeraisProduto.Open;

      wCont:=1;
      NewWord := GetOrCreateObject( 'Word.Application' );
      NewWord.Visible := True;
      NewWord.Documents.Add;
      // Obtem documento e paragrafo
      Document := NewWord.Documents.Item(1);
      Document.PageSetup.LeftMargin:='1,5';
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'PRODUTOR: '+DMParamSistema.QParamSistemaDesc_Empresa.Value;
      Document.Paragraphs.Item(wCont).Alignment := '1';

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'DADOS GERAIS';
      Range.Bold := 1;
      Range.Font.Size := 14;
      Document.Paragraphs.Item(wCont).Alignment := '1';

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'CNPJ: '+DMOracle.BuscaNome('SELECT TB_FILIAL.NUM_CGC FROM TB_FILIAL','COD_FILIAL = '+DMPlantioSafra.QPlantioSafraCod_Filial.Text);
      Document.Paragraphs.Item(wCont).Alignment := '1';
      Range.Bold := 0;
      Range.Font.Size := 8;

      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'ESPÉCIE...... '+Trim(MEDesc_Cultura.Text);
      Document.Paragraphs.Item(wCont).Alignment := '0';
      Range.Bold := 0;
      Range.Font.Size := 9;

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'CLASSE........ '+Trim(MEClasse_Plantio.Text);

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      Range.Text := 'SAFRA......... '+Trim(MEDesc_Safra.Text);

      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;
      Inc(wCont);
      Document.Paragraphs.Add;

      Inc(wCont);
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(wCont).Range;
      table := Document.Tables.Add(Range,1,8); // novoDoc.Tables.Add(Selection.Range, 3, 5)
      table.Borders.enable:=false; // desabilita as bordas da tabela
      table.Cell(1,1).Width:= '4,5';
      table.Cell(1,2).Width:= '1,5';
      table.Cell(1,3).Width:= '0,5';
      table.Cell(1,4).Width:= '4,5';
      table.Cell(1,5).Width:= '1,5';
      table.Cell(1,6).Width:= '0,5';
      table.Cell(1,7).Width:= '4,5';
      table.Cell(1,8).Width:= '1,5';
      table.Cell(1,1).Range.Text:='01-LOCALIZAÇÃO CAMPOS';
      table.Cell(1,2).Range.Text:='';

      table.Cell(1,3).Range.Text:='';
      table.Cell(1,4).Range.Text:='';
      table.Cell(1,7).Range.Text:='02-Nª CAMPOS INSCRITOS';
      table.Rows.Add;
      table.Cell(2,1).Range.Text:='__________________________';
      table.Cell(2,7).Range.Text:='__________________________';
      QRDadosGeraisCidade.First;
      while not(QRDadosGeraisCidade.eof) do //laço que imprime as identificações das cidades
      begin
        table.Rows.Add;
        table.Cell(QRDadosGeraisCidade.RecNo+2,1).Range.Text:=QRDadosGeraisCidadeCidade.Value;
        table.Cell(QRDadosGeraisCidade.RecNo+2,7).Range.Text:=QRDadosGeraisCidadeCidade.Value;
        table.Cell(QRDadosGeraisCidade.RecNo+2,8).Range.Text:=FloatToStr(QRDadosGeraisCidadeNum_Cooperante.Value);
        wTotal:=wTotal+(QRDadosGeraisCidadeNum_Cooperante.Value);
        QRDadosGeraisCidade.Next;
      end;
      table.Rows.Add;
      table.Cell(QRDadosGeraisCidade.RecNo+3,1).Range.Text:='__________________________';
      table.Cell(QRDadosGeraisCidade.RecNo+3,7).Range.Text:='__________________________';
      // desenha segunda parte da tabela..... parte dos cultivares
      QRDadosGeraisProduto.First; // posiciona query no inicio
      table.Rows.Add;
      table.Cell(QRDadosGeraisCidade.RecNo+4,7).Range.Text:='Total:';
      table.Cell(QRDadosGeraisCidade.RecNo+4,8).Range.Text:=FloatToStr(wTotal);
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Cell(QRDadosGeraisCidade.RecNo+9,1).Range.Text:='03-ÁREA TOTAL INSCRITA';
      table.Cell(QRDadosGeraisCidade.RecNo+9,4).Range.Text:='04-ESTIMATIVA PRODUÇÃO';
      table.Cell(QRDadosGeraisCidade.RecNo+9,7).Range.Text:='05-META DE PRODUÇÃO';
      Document.Paragraphs.Item(wCont).Alignment := '0';
      table.Cell(QRDadosGeraisCidade.RecNo+9,2).Range.Text:='(HA)';
      table.Cell(QRDadosGeraisCidade.RecNo+9,5).Range.Text:='(T)';
      table.Cell(QRDadosGeraisCidade.RecNo+9,8).Range.Text:='(T)';
      table.Rows.Add;
      table.Cell(QRDadosGeraisCidade.RecNo+10,1).Range.Text:='__________________________';
      table.Cell(QRDadosGeraisCidade.RecNo+10,4).Range.Text:='__________________________';
      table.Cell(QRDadosGeraisCidade.RecNo+10,7).Range.Text:='__________________________';
      QRDadosGeraisProduto.First;
      while not(QRDadosGeraisProduto.eof) do
      begin
        table.Rows.Add;
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,1).Range.Text:=QRDadosGeraisProdutoCultivar.Value;
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,2).Range.Text:=QRDadosGeraisProdutoArea.Value;
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,4).Range.Text:=QRDadosGeraisProdutoCultivar.Value;
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,7).Range.Text:=QRDadosGeraisProdutoCultivar.Value;
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,5).Range.Text:=Bib.NumToTexto(((QRDadosGeraisProdutoArea.Value*QRDadosGeraisProdutoVal_Estimativa.Value)),2,8);
        table.Cell((QRDadosGeraisCidade.RecNo+10)+QRDadosGeraisProduto.RecNo+2,8).Range.Text:=Bib.NumToTexto(((QRDadosGeraisProdutoArea.Value*QRDadosGeraisProdutoVal_Meta.Value)),2,8);
        wEstimativaTotal:=wEstimativaTotal+((QRDadosGeraisProdutoArea.Value*QRDadosGeraisProdutoVal_Estimativa.Value));
        wMetaTotal:=wMetaTotal+((QRDadosGeraisProdutoArea.Value*QRDadosGeraisProdutoVal_Meta.Value));
        wAreaTotal:=wAreaTotal+QRDadosGeraisProdutoArea.Value;
        QRDadosGeraisProduto.Next;
      end;
      table.Rows.Add;
      table.Cell((QRDadosGeraisCidade.RecNo+11)+QRDadosGeraisProduto.RecNo+2,1).Range.Text:='__________________________';
      table.Cell((QRDadosGeraisCidade.RecNo+11)+QRDadosGeraisProduto.RecNo+2,4).Range.Text:='__________________________';
      table.Cell((QRDadosGeraisCidade.RecNo+11)+QRDadosGeraisProduto.RecNo+2,7).Range.Text:='__________________________';
      table.Rows.Add;
      table.Cell((QRDadosGeraisCidade.RecNo+13)+QRDadosGeraisProduto.RecNo+3,1).Range.Text:='TOTAL: ';
      table.Cell((QRDadosGeraisCidade.RecNo+13)+QRDadosGeraisProduto.RecNo+3,2).Range.Text:= wAreaTotal;
      table.Cell((QRDadosGeraisCidade.RecNo+13)+QRDadosGeraisProduto.RecNo+3,5).Range.Text:= Bib.NumToTexto(wEstimativaTotal,2,8);
      table.Cell((QRDadosGeraisCidade.RecNo+13)+QRDadosGeraisProduto.RecNo+3,8).Range.Text:= Bib.NumToTexto(wMetaTotal,2,8);
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Cell((QRDadosGeraisCidade.RecNo+18)+QRDadosGeraisProduto.RecNo+3,1).Range.Text:=DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+Trim(DMPlantioSafra.QPlantioSafraCod_Filial.Text))+','+DateToStr(Date);
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Rows.Add;
      table.Cell((QRDadosGeraisCidade.RecNo+25)+QRDadosGeraisProduto.RecNo+3,1).Range.Text:='__________________________';
      table.Cell((QRDadosGeraisCidade.RecNo+25)+QRDadosGeraisProduto.RecNo+3,7).Range.Text:='__________________________';
      table.Rows.Add;
      table.Cell((QRDadosGeraisCidade.RecNo+27)+QRDadosGeraisProduto.RecNo+3,1).Range.Text:='RESPONSÁVEL TÉCNICO';
      table.Cell((QRDadosGeraisCidade.RecNo+27)+QRDadosGeraisProduto.RecNo+3,7).Range.Text:='PRODUTOR';
//      table.Column(1).Alignment := '2';
    end;
  end
  else
    showmessage('Deve ser Escolhida uma Safra!');
end;
procedure TFEstimativaMetaCad.BitBtn1Click(Sender: TObject);
begin
  if FPlantioSafraCons = nil then
     FPlantioSafraCons:= TFPlantioSafraCons.Create(Application);
   if FPlantioSafraCons.ShowModal = mrOk then
   begin
     with  DMPlantioSafra do
     begin
       FEstimativaMetaCad.MECod_Safra.Text:=IntToStr(QPlantioSafraConsCod_Plantio_Safra.Value);
     end;
   end;
end;

procedure TFEstimativaMetaCad.BTEditarClick(Sender: TObject);
begin
  DMEstimativaMeta.QEstimativaMeta.Edit;
end;

procedure TFEstimativaMetaCad.BTConfirmarClick(Sender: TObject);
begin
  DMEstimativaMeta.QEstimativaMeta.Post;
end;

end.
