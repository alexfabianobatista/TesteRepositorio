unit UPrecoLote_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, UFmClasse, UFmLote, UFmMarca, UFmProduto, Grids,
  DBGrids;

type
  TFPrecoLote_Cad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label33: TLabel;
    MECodLote: TMaskEdit;
    MECodProduto: TMaskEdit;
    MePrecoVarejo: TMaskEdit;
    MELote: TMaskEdit;
    MEProduto: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MePrecoAtacado: TMaskEdit;
    BtnConfirma: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet2: TTabSheet;
    MePorcentagem: TMaskEdit;
    LblPorcentagem: TLabel;
    Fm1Classe: TFmClasse;
    BitBtn2: TBitBtn;
    Fm1Lote: TFmLote;
    Fm1Marca: TFmMarca;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    MeVarejo: TMaskEdit;
    BitBtn5: TBitBtn;
    Fm2Produto: TFmProduto;
    Label2: TLabel;
    MeAtacado: TMaskEdit;
    Fm2Lote: TFmLote;
    Fm2Classe: TFmClasse;
    Fm2Marca: TFmMarca;
    DBGrid1: TDBGrid;
    DsPrecoLoteCons: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MECodProdutoExit(Sender: TObject);
    procedure MECodLoteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnConfirmaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrecoLote_Cad: TFPrecoLote_Cad;

implementation

uses UTipoLoteCons, UTipoLote_cl, UProdutoCons, UProduto_cl, UOracle_cl, Ubiblioteca,
  UrPrecoLote, UProdutoRelatorio_cl, UProdutoParam, UPrecos_cl,
  UParamSistema_cl, UUsuario_cl;

{$R *.dfm}

procedure TFPrecoLote_Cad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons=Nil then
    FTipoLoteCons:=TFTipoLoteCons.Create(Application);
  If (FTipoLoteCons.Showmodal = MrOk) then
    begin
      Try
        MECodLote.text:=FloatToStr(DMTipoLote.QTipoLoteConsCod_Lote_Tipo.value);
        MECodLoteExit(Self);
      except
        MECodLote.Clear;
      end;
    end;

end;

procedure TFPrecoLote_Cad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons=Nil then
    FProdutoCons:=TFProdutoCons.Create(Application);
  If (FProdutoCons.Showmodal = MrOk) then
  begin
    Try
      MECodProduto.Text:=FloatToStr(DMProduto.QProdutoConsCod_Produto.value);
      MECodProdutoExit(Self);
    except
      MECodProduto.Clear;
    end;
  end;

end;

procedure TFPrecoLote_Cad.MECodProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodProduto.Text) <> '' then
  begin
    MEProduto.Text:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text,True);

    DMPrecos.QPrecoLoteCons.Close;
    DMPrecos.QPrecoLoteCons.SetVariable('Cod_Produto',StrToInt(Trim(MECodProduto.Text)));
    DMPrecos.QPrecoLoteCons.Open;

  end
  else
     MEProduto.Clear;
  If (Trim(MeCodProduto.Text) <> '') And
     (Trim(MECodLote.Text)    <> '') Then
   Begin
     MePrecoVarejo.Text := FloatToStr(StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRECO_LOTE','COD_PRODUTO = '+MECodProduto.text + ' AND COD_LOTE_TIPO = '+MECodLote.text)));
     MePrecoAtacado.Text := FloatToStr(StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRECO_LOTE','COD_PRODUTO = '+MECodProduto.text + ' AND COD_LOTE_TIPO = '+MECodLote.text)));
   End;
end;

procedure TFPrecoLote_Cad.MECodLoteExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodLote.Text) <> '' then
     MELote.Text:=DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MECodLote.text,True)
  else
    MELote.Clear;
  If (Trim(MeCodProduto.Text) <> '') And
     (Trim(MECodLote.Text)    <> '') Then
   Begin
     MePrecoVarejo.Text := FloatToStr(StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRECO_LOTE','COD_PRODUTO = '+MECodProduto.text + ' AND COD_LOTE_TIPO = '+MECodLote.text)));
     MePrecoAtacado.Text := FloatToStr(StrToFloat('0'+DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRECO_LOTE','COD_PRODUTO = '+MECodProduto.text + ' AND COD_LOTE_TIPO = '+MECodLote.text)));
   End;

end;

procedure TFPrecoLote_Cad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FProdutoParam = nil then
    FProdutoParam := TFProdutoParam.Create(Application);
  FProdutoParam.PGRelatorio.Pages[38].TabVisible := true;
  if(FProdutoParam.ShowModal = mrOk) then
  begin
    with DMProdutoRelatorio do
    begin
      QRProdutoLote.Close;

      If Trim(FProdutoParam.ME38CodFilial.text) <> '' then
        QRProdutoLote.SetVariable('COD_FILIAL', FProdutoParam.ME38CodFilial.text);

      if (FProdutoParam.RG38Produtos.ItemIndex = 0) then  //possuem preco e quantidade
      begin
        QRProdutoLote.sql.Clear;
        QRProdutoLote.sql.add('SELECT PL.COD_PRODUTO,PR.DESC_PRODUTO,PR.DESC_UNIDADE, MA.DESC_MARCA,ES.DESC_LOCALIZACAO, '+
        'ES.QT_QUANTIDADE,PL.COD_LOTE_TIPO, PL.VAL_VAREJO, PL.VAL_ATACADO, LT.DESC_LOTE '+
        'FROM TB_PRECO_LOTE PL, TB_ESTOQUE ES, TB_PRODUTO PR, TB_MARCA MA, TB_LOTE_TIPO LT '+
        'WHERE PL.COD_PRODUTO = ES.COD_PRODUTO(+) '+
        'AND ES.COD_LOTE_TIPO = PL.COD_LOTE_TIPO '+
        'AND PR.COD_PRODUTO = PL.COD_PRODUTO '+
        'AND PR.COD_MARCA = MA.COD_MARCA(+) '+
        'AND PL.COD_LOTE_TIPO = LT.COD_LOTE_TIPO '+
        'AND PL.VAL_VAREJO >= 0 '+
        'AND PL.VAL_ATACADO >= 0 '+
        'and ES.QT_QUANTIDADE >= 0 '+
        'AND ES.COD_FILIAL = :COD_FILIAL');
      end;
      if (FProdutoParam.RG38Produtos.ItemIndex = 1) then //não possuem preco e quantidade
      begin
        QRProdutoLote.sql.Clear;
        QRProdutoLote.SQL.Add('SELECT PL.COD_PRODUTO,PR.DESC_PRODUTO,PR.DESC_UNIDADE, MA.DESC_MARCA,ES.DESC_LOCALIZACAO, '+
        'ES.QT_QUANTIDADE,PL.COD_LOTE_TIPO, PL.VAL_VAREJO, PL.VAL_ATACADO, LT.DESC_LOTE '+
        'FROM TB_PRECO_LOTE PL, TB_ESTOQUE ES, TB_PRODUTO PR, TB_MARCA MA, TB_LOTE_TIPO LT '+
        'WHERE PL.COD_PRODUTO = ES.COD_PRODUTO(+) '+
        'AND ES.COD_LOTE_TIPO = PL.COD_LOTE_TIPO '+
        'AND PR.COD_PRODUTO = PL.COD_PRODUTO '+
        'AND PR.COD_MARCA = MA.COD_MARCA(+) '+
        'AND PL.COD_LOTE_TIPO = LT.COD_LOTE_TIPO '+
        'AND PL.VAL_VAREJO <= 0 '+
        'AND PL.VAL_ATACADO <= 0 '+
        'and ES.QT_QUANTIDADE <= 0 '+
        'AND ES.COD_FILIAL = :COD_FILIAL');
      end;
      if (FProdutoParam.RG38Produtos.ItemIndex = 2) then //não possue preco ou quantidade
      begin
        QRProdutoLote.sql.Clear;
        QRProdutoLote.SQL.Add('SELECT PL.COD_PRODUTO,PR.DESC_PRODUTO,PR.DESC_UNIDADE, MA.DESC_MARCA,ES.DESC_LOCALIZACAO, '+
        'ES.QT_QUANTIDADE,PL.COD_LOTE_TIPO, PL.VAL_VAREJO, PL.VAL_ATACADO, LT.DESC_LOTE '+
        'FROM TB_PRECO_LOTE PL, TB_ESTOQUE ES, TB_PRODUTO PR, TB_MARCA MA, TB_LOTE_TIPO LT '+
        'WHERE PL.COD_PRODUTO = ES.COD_PRODUTO(+) '+
        'AND ES.COD_LOTE_TIPO = PL.COD_LOTE_TIPO '+
        'AND PR.COD_PRODUTO = PL.COD_PRODUTO '+
        'AND PR.COD_MARCA = MA.COD_MARCA(+) '+
        'AND PL.COD_LOTE_TIPO = LT.COD_LOTE_TIPO '+
        'AND (((PL.VAL_VAREJO <= 0) OR (PL.VAL_ATACADO <= 0)) OR (ES.QT_QUANTIDADE <= 0)) '+
        'AND ES.COD_FILIAL = :COD_FILIAL');
      end;

      QRProdutoLote.Open;

      if FrPrecoLote = nil then
        FrPrecoLote := TFrPrecoLote.Create(Application);

      FrPrecoLote.QRPrimario.Preview;
      QRProdutoLote.Close;
    End;
  end;
end;

procedure TFPrecoLote_Cad.BtnConfirmaClick(Sender: TObject);
var
  wAudit:string;
begin
  inherited;
  wAudit := '';
  If Trim(MeCodLote.Text) = '' Then
     Raise Exception.Create('Preencher Código Lote');
  If Trim(MECodProduto.Text) = '' Then
     Raise Exception.Create('Preencher Código Produto');
  If DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+MECodLote.text,True) = '' Then
     Raise Exception.Create('Lote não cadastrado');
  If DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MECodProduto.text,True) = '' Then
     Raise Exception.Create('Produto não cadastrado');
  If DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRECO_LOTE','COD_PRODUTO = '+MECodProduto.text+
        ' And COD_LOTE_TIPO = '+MECodLote.text) = '' Then
     with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('INSERT INTO TB_PRECO_LOTE(COD_PRODUTO,COD_LOTE_TIPO,VAL_VAREJO,VAL_ATACADO) ');
          QExecSQL.SQL.Add('VALUES ('+Trim(MECodProduto.text)+','+Trim(MECodLote.text)+','+Bib.TrocaVirgulaPorPonto(Trim(MePrecoVarejo.Text))+','+Bib.TrocaVirgulaPorPonto(Trim(MePrecoAtacado.Text))+')');
          QExecSQL.ExecSQL;
                     ///INCLUÍDO PARA VERIFICAR AS ALTERAÇÕES DE PREÇO NA INSIDE POR RECLAMAÇÃO DO ISAAC DE QUE OS
          ///PRODUTOS VOLTAM O VALOR - CLEBER 24/01/2020
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') then
          begin
            wAudit := 'INSERT INTO TB_AUDIT(COD_USUARIO, IND_OPERACAO, NOME_TABELA, ' +
                      'DESC_CAMPO01, DESC_VALOR01, DESC_CAMPO02, DESC_VALOR02, DESC_CAMPO03, DESC_VALOR03,' +
                      ' DESC_CAMPO04, DESC_VALOR04, DT_AUDIT)' +
                      ' VALUES(' + QuotedStr(DMUsuario.QUsuarioCOD_USUARIO.Text) +
                      ', ' + QuotedStr('Alteração') + ', ' + QuotedStr('TB_PRECO_LOTE') + ', ' +
                      QuotedStr('COD_PRODUTO') + ', ' + QuotedStr(MECodProduto.text) + ', '+
                      QuotedStr('COD_LOTE_TIPO') + ', ' + QuotedStr(MECodLote.text) + ', '+
                      QuotedStr('VAL_ATACADO') + ', ' + QuotedStr(MePrecoAtacado.Text) + ', '+
                      QuotedStr('TELA') + ', ' + QuotedStr('CADASTROPRECOLOTE.CONFIRMA') + ', ' +
                      'TO_DATE(' + QuotedStr(DateTimeToStr(DMOracle.DataHoraServ)) + ', ' + QuotedStr('DD/MM/YYYY HH24:MI:SS') +
                        '))';
            ExecutaSql(wAudit);
          end;

          DMOracle.DBCemapa.Commit;

        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Não inseriu novos preços');
        end;
      end
  Else
     with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_PRECO_LOTE SET VAL_VAREJO = ' + bib.TrocaVirgulaPorPonto(Trim(MePrecoVarejo.Text))+',VAL_ATACADO = '+Bib.TrocaVirgulaPorPonto(Trim(MePrecoAtacado.Text)));
          QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + chr(39) + Trim(MeCodProduto.Text) + chr(39)+ ' AND COD_LOTE_TIPO='+ chr(39) +Trim(MECodLote.text)+ chr(39));
          QExecSQL.ExecSQL;

          ///INCLUÍDO PARA VERIFICAR AS ALTERAÇÕES DE PREÇO NA INSIDE POR RECLAMAÇÃO DO ISAAC DE QUE OS
          ///PRODUTOS VOLTAM O VALOR - CLEBER 24/01/2020
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') then
          begin
            wAudit := 'INSERT INTO TB_AUDIT(COD_USUARIO, IND_OPERACAO, NOME_TABELA, ' +
                      'DESC_CAMPO01, DESC_VALOR01, DESC_CAMPO02, DESC_VALOR02, DESC_CAMPO03, DESC_VALOR03,' +
                      ' DESC_CAMPO04, DESC_VALOR04, DESC_CAMPO05, DESC_VALOR05, DT_AUDIT)' +
                      ' VALUES(' + QuotedStr(DMUsuario.QUsuarioCOD_USUARIO.Text) +
                      ', ' + QuotedStr('Alteração') + ', ' + QuotedStr('TB_PRECO_LOTE') + ', ' +
                      QuotedStr('COD_PRODUTO') + ', ' + QuotedStr(MECodProduto.text) + ', '+
                      QuotedStr('COD_LOTE_TIPO') + ', ' + QuotedStr(MECodLote.text) + ', '+
                      QuotedStr('VAL_ATACADO') + ', ' + QuotedStr(MePrecoAtacado.Text) + ', '+
                      QuotedStr('VAL_VAREJO') + ', ' + QuotedStr(MePrecoVarejo.Text) + ', '+
                      QuotedStr('TELA') + ', ' + QuotedStr('CADASTROPRECOLOTE.CONFIRMA') + ', ' +
                      'TO_DATE(' + QuotedStr(DateTimeToStr(DMOracle.DataHoraServ)) + ', ' + QuotedStr('DD/MM/YYYY HH24:MI:SS') +
                        '))';
            ExecutaSql(wAudit);
          end;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Não atualizou novos preços');
        end;
      end;


  MePrecoVarejo.Clear;
  MePrecoAtacado.Clear;

end;

procedure TFPrecoLote_Cad.BitBtn2Click(Sender: TObject);
Var wVarejo, wAtacado : Real;
begin
  inherited;
  If Trim(Fm1Lote.MeLote.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+Trim(Fm1Lote.MeLote.text),True) = '' Then
        Raise Exception.Create('Lote não cadastrado');
  If Trim(Fm1Classe.MeClasse.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(Fm1Classe.MeClasse.text),True) = '' Then
        Raise Exception.Create('Classe não cadastrado');
  If Trim(Fm1Marca.MeMarca.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA','COD_MARCA = '+Trim(Fm1Marca.MeMarca.text),True) = '' Then
        Raise Exception.Create('Marca não cadastrado');
  If Trim(MePorcentagem.Text) = '' Then
     Raise Exception.Create('Informar percentual de reajuste');
  If StrToFloat(Trim(MePorcentagem.Text)) = 0 Then
     Raise Exception.Create('Informar percentual de reajuste diferente de zeros');
  DmPrecos.QProdutoLote.Close;
  If Trim(Fm1Lote.MeLote.Text) <> '' Then
     DMPrecos.QProdutoLote.SetVariable('Cod_Lote_Tipo',Trim(Fm1Lote.MeLote.Text))
  Else
     DMPrecos.QProdutoLote.SetVariable('Cod_Lote_Tipo',Null);
  If Trim(Fm1Classe.MeClasse.Text) <> '' Then
     DMPrecos.QProdutoLote.SetVariable('Cod_Classe',Trim(Fm1Classe.MeClasse.Text))
  Else
     DMPrecos.QProdutoLote.SetVariable('Cod_Classe',Null);
  If Trim(Fm1Marca.MeMarca.Text) <> '' Then
     DMPrecos.QProdutoLote.SetVariable('Cod_Marca',Trim(Fm1Marca.MeMarca.Text))
  Else
     DMPrecos.QProdutoLote.SetVariable('Cod_Marca',Null);
  DMPrecos.QProdutoLote.Open;
  try
    DMOracle.DBCemapa.StartTransaction;
    While Not(DMPrecos.QProdutoLote.Eof) Do
    Begin
      wVarejo := DMPrecos.QProdutoLoteVal_Varejo.Value +
         DMPrecos.QProdutoLoteVal_Varejo.Value * StrToFloat(Trim(MePorcentagem.Text)) / 100;
      wAtacado := DMPrecos.QProdutoLoteVal_Atacado.Value +
         DMPrecos.QProdutoLoteVal_Atacado.Value * StrToFloat(Trim(MePorcentagem.Text)) / 100;
      with DMOracle do
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_PRECO_LOTE SET VAL_VAREJO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wVarejo)) + ',VAL_ATACADO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wAtacado)));
        QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + chr(39) + Trim(DMPrecos.QProdutoLoteCod_Produto.text) + chr(39) + ' AND COD_LOTE_TIPO=' + chr(39) + Trim(DMPrecos.QProdutoLoteCod_Lote_Tipo.text) + chr(39));
        QExecSQL.ExecSQL;
      end;
      DMPrecos.QProdutoLote.Next;
    end;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DbCemapa.Rollback;
  end;
  DMPrecos.QProdutoLote.Close;
end;

procedure TFPrecoLote_Cad.BitBtn5Click(Sender: TObject);
Var wVarejo, wAtacado : Real;
begin
  inherited;
  If Trim(Fm2Lote.MeLote.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+Trim(Fm2Lote.MeLote.text),True) = '' Then
        Raise Exception.Create('Lote não cadastrado');
  If Trim(Fm2Classe.MeClasse.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(Fm2Classe.MeClasse.text),True) = '' Then
        Raise Exception.Create('Classe não cadastrado');
  If Trim(Fm2Marca.MeMarca.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_MARCA FROM TB_MARCA','COD_MARCA = '+Trim(Fm2Marca.MeMarca.text),True) = '' Then
        Raise Exception.Create('Marca não cadastrado');
  If Trim(Fm2Produto.MeProduto.text) <> '' Then
     If DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(Fm2Produto.MeProduto.text),True) = '' Then
        Raise Exception.Create('Produto não cadastrado');
  If Trim(MeVarejo.Text) = '' Then
     Raise Exception.Create('Informar percentual de reajuste varejo');
  If StrToFloat(Trim(MeVarejo.Text)) = 0 Then
     Raise Exception.Create('Informar percentual de reajuste varejo diferente de zeros');
  If Trim(MeAtacado.Text) = '' Then
     Raise Exception.Create('Informar percentual de reajuste atacado');
  If StrToFloat(Trim(MeAtacado.Text)) = 0 Then
     Raise Exception.Create('Informar percentual de reajuste atacado diferente de zeros');
  DmPrecos.QProdutoLoteEstoque.Close;
  If Trim(Fm2Lote.MeLote.Text) <> '' Then
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Lote_Tipo',Trim(Fm2Lote.MeLote.Text))
  Else
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Lote_Tipo',Null);
  If Trim(Fm2Classe.MeClasse.Text) <> '' Then
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Classe',Trim(Fm2Classe.MeClasse.Text))
  Else
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Classe',Null);
  If Trim(Fm2Marca.MeMarca.Text) <> '' Then
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Marca',Trim(Fm2Marca.MeMarca.Text))
  Else
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Marca',Null);
  If Trim(Fm2Produto.MeProduto.Text) <> '' Then
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Produto',Trim(Fm2Produto.MeProduto.Text))
  Else
     DMPrecos.QProdutoLoteEstoque.SetVariable('Cod_Produto',Null);
  DMPrecos.QProdutoLoteEstoque.Open;
  try
    DMOracle.DBCemapa.StartTransaction;
    While Not(DMPrecos.QProdutoLoteEstoque.Eof) Do
    Begin
      wVarejo := DMPrecos.QProdutoLoteEstoqueVl_Custo_Medio.Value +
         DMPrecos.QProdutoLoteEstoqueVl_Custo_Medio.Value * StrToFloat(Trim(MeVarejo.Text)) / 100;
      wAtacado := DMPrecos.QProdutoLoteEstoqueVl_Custo_Medio.Value +
         DMPrecos.QProdutoLoteEstoqueVl_Custo_Medio.Value * StrToFloat(Trim(MeAtacado.Text)) / 100;
      If DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRECO_LOTE','COD_PRODUTO = '+DMPrecos.QProdutoLoteEstoqueCod_Produto.Text +
         ' And COD_LOTE_TIPO = '+DMPrecos.QProdutoLoteEstoqueCod_Lote_Tipo.text) = '' Then
          with DMOracle do
           begin
             QExecSQL.Close;
             QExecSQL.SQL.Clear;
             QExecSQL.SQL.Add('INSERT INTO TB_PRECO_LOTE(COD_PRODUTO,COD_LOTE_TIPO,VAL_VAREJO,VAL_ATACADO) ');
             QExecSQL.SQL.Add('VALUES ('+DMPrecos.QProdutoLoteEstoqueCod_Produto.text+','+
                                         DMPrecos.QProdutoLoteEstoqueCod_Lote_Tipo.text+','+
                                         Bib.TrocaVirgulaPorPonto(FloatToStr(wVarejo))+','+
                                         Bib.TrocaVirgulaPorPonto(FloatToStr(wAtacado))+')');
             QExecSQL.ExecSQL;
           end
      Else
          with DMOracle do
           begin
             QExecSQL.Close;
             QExecSQL.SQL.Clear;
             QExecSQL.SQL.Add('UPDATE TB_PRECO_LOTE SET VAL_VAREJO = ' +
                                        bib.TrocaVirgulaPorPonto(FloatToStr(wVarejo))+',VAL_ATACADO = '+
                                        Bib.TrocaVirgulaPorPonto(FloatToStr(wAtacado)));
             QExecSQL.SQL.Add('WHERE COD_PRODUTO = ' + chr(39) + DMPrecos.QProdutoLoteEstoqueCod_Produto.text +
                       chr(39)+ ' AND COD_LOTE_TIPO='+ chr(39) + DMPrecos.QProdutoLoteEstoqueCod_Lote_Tipo.text+ chr(39));
             QExecSQL.ExecSQL;
           end;
      DMPrecos.QProdutoLoteEstoque.Next;
    End;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DbCemapa.Rollback;
  End;
  DMPrecos.QProdutoLoteEstoque.Close;
end;

end.
