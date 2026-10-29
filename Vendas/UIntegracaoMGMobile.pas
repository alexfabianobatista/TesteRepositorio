unit UIntegracaoMGMobile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, UBiblioteca, Math, ExtCtrls;

type
  TFIntegracaoMGMobile = class(TForm)
    Panel1: TPanel;
    GBExportar: TGroupBox;
    BTExportarClientes: TBitBtn;
    BTExportarProdutos: TBitBtn;
    BTExportarDuplicatas: TBitBtn;
    BTExportarPrazos: TBitBtn;
    GBImportar: TGroupBox;
    BTImportarPedidos: TBitBtn;
    BTImportarClientes: TBitBtn;
    procedure BTExportarClientesClick(Sender: TObject);
    procedure BTExportarProdutosClick(Sender: TObject);
    procedure BTExportarDuplicatasClick(Sender: TObject);
    procedure BTExportarPrazosClick(Sender: TObject);
    procedure BTImportarPedidosClick(Sender: TObject);
    procedure BTImportarClientesClick(Sender: TObject);
  private
    procedure SubDiretorios(Diretorio: string; var Lista: TStringList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIntegracaoMGMobile: TFIntegracaoMGMobile;

implementation

uses UCadastro_cl, MaskUtils, UProduto_cl, DB, UOracle_cl, UNotaSaida_cl,
  UContasReceber_cl, UPrazoVencimento_cl, UPedido_cl, UUsuario_cl, NfeTypes;

{$R *.dfm}

procedure TFIntegracaoMGMobile.BTExportarClientesClick(Sender: TObject);
var
  posVirgula: Integer;
  linha: String;
  arquivo: TextFile;
begin
  try
    Panel1.Enabled := false;
    with DMCadastro do
    begin
      QCadastroCons.Close;
      QCadastroCons.SQL.Delete(QCadastroCons.SQL.Count-1);
      QCadastroCons.SQL.Add('AND TB_CADASTRO.DT_CANCELAMENTO IS NULL');
      QCadastroCons.Open;
      if FileExists('c:\mgmobile\imptxt\CADCLI.TXT') then
        DeleteFile('c:\mgmobile\imptxt\CADCLI.TXT');
      AssignFile(arquivo,  'c:\mgmobile\imptxt\CADCLI.TXT');
      Rewrite(arquivo);
      Cursor := crHourGlass;
      while not QCadastroCons.Eof do
      begin
        linha := QCadastroConsCOD_CADASTRO.Text;
        linha := linha + '|' + Copy(QCadastroConsNOME.Value,0,50) + '|';
        posVirgula := pos(',',QCadastroConsDESC_ENDERECO.Value);
        if Length(QCadastroConsDESC_ENDERECO.Value) > 0 then
          linha := linha + Copy( bib.ift(posVirgula = 0, Trim(QCadastroConsDESC_ENDERECO.Value),
          Trim(Copy(QCadastroConsDESC_ENDERECO.Value,1,posVirgula-1))) +
          '['+Bib.NumEndereco(QCadastroConsDESC_ENDERECO.Text)+']', 0, 50);
        linha := linha + '|' + Copy(QCadastroConsDESC_BAIRRO.Value, 0, 25);
        linha := linha + '|' + Copy(QCadastroConsDESC_CIDADE.Value, 0, 30);
        linha := linha + '|' + QCadastroConsCOD_ESTADO.Value;
        linha := linha + '|' + FormatMaskText('99.999-999;0;_', QCadastroConsDESC_CEP.Value);
        linha := linha + '|' + Bib.FormataCNPJ_CPF(QCadastroConsNUM_CGC_CPF.Value);
        linha := linha + '|' + QCadastroConsNUM_INSCRICAO.Value;
        linha := linha + '|' + QCadastroConsDESC_TELEFONE.Value;
        linha := linha + '|' + QCadastroConsDESC_FAX.Value;
        linha := linha + '|' + Copy(Bib.ift((QCadastroConsIND_FISICA_JURIDICA.Value = 'F') or
          (QCadastroConsNOME_CONTATO.Value = ''), QCadastroConsNOME.Value,
          QCadastroConsNOME_CONTATO.Value), 0, 35);
        linha := linha + '|' + Bib.ift(QCadastroConsIND_FISICA_JURIDICA.Value = 'F',
          QCadastroConsDT_NASCIMENTO.Text, QCadastroConsDT_NASCIMENTO.Text);
        linha := linha + '||' + TNFeIntegerComZero.Create(QCadastroConsCOD_VENDEDOR.Value, 4).ToString;
        linha := linha + '|' + QCadastroConsDT_CADASTRO.Text;
        linha := linha + '|' + TNFeFloat2.Create(QCadastroConsVAL_LIMITE.Value).ToString;
        linha := linha + '|' + Bib.ift(QCadastroConsIND_FISICA_JURIDICA.Value = 'F', '',
          QCadastroConsDT_FUNDACAO.Text);
        linha := linha + '||||' + Copy(QCadastroConsDESC_FANTASIA.Value, 0, 40);
        linha := linha + '|||||' + QCadastroConsIND_FISICA_JURIDICA.Value;
        linha := linha + '|' + QCadastroConsDESC_CELULAR.Value;
        linha := linha + '|' + QCadastroConsDESC_CLASSIFICACAO.Value;
        linha := linha + '|' + QCadastroConsDESC_E_MAIL.Value;
        linha := linha + '|||' + QCadastroConsDESC_OBS.Value;
        linha := linha + '|' + QCadastroConsCOD_VENDEDOR_PREPOSTO.Text;
        linha := linha + '||0.00';

        Writeln(arquivo, linha);
        QCadastroCons.Next;
      end;
      Cursor := crDefault;
      CloseFile(arquivo);
      ShowMessage('Exportação realizada com sucesso.');
    end;
  except
    on E: Exception do
      begin
          MessageDlg('Erro na exportação de clientes.' + #13 + #10 +
            E.Message, mtError, [mbOK], 0);
      end;
  end;
  Panel1.Enabled := True;
end;

procedure TFIntegracaoMGMobile.BTExportarProdutosClick(Sender: TObject);
var
  posVirgula: Integer;
  linha, qtEstoque: String;
  arquivo: TextFile;
begin
  Panel1.Enabled := false;
  try
    with DMProduto do
    begin
      QProdutoCons.Close;
      QProdutoCons.SQL.Delete(QProdutoCons.SQL.Count - 1);
      QProdutoCons.SQL.Add(' AND TB_PRODUTO.IND_SITUACAO = ''ATIVO'' AND TB_PRODUTO.IND_TIPO_PRODUTO = ''COMERCIAL'' AND NVL(VAL_VAREJO,0) > 0');
      QProdutoCons.Open;
      if FileExists('c:\mgmobile\imptxt\CADPRO.TXT') then
        DeleteFile('c:\mgmobile\imptxt\CADPRO.TXT');
      AssignFile(arquivo,  'c:\mgmobile\imptxt\CADPRO.TXT');
      Rewrite(arquivo);
      Cursor := crHourGlass;
      while not QProdutoCons.Eof do
      begin
        linha := QProdutoConsCOD_PRODUTO.Text;
        linha := linha + '|' + Copy(QProdutoConsDESC_PRODUTO.Value,0,100);
        linha := linha + '|' + QProdutoConsDESC_UNIDADE.Value;
        linha := linha + '|' + QProdutoConsNUM_EMBALAGEM.Text;
        qtEstoque := DMOracle.BuscaNome('SELECT SUM(QT_QUANTIDADE) FROM TB_ESTOQUE','COD_PRODUTO = '+
          QProdutoConsCOD_PRODUTO.Text);
        linha := linha + '|' + Bib.ift(qtEstoque = '', '0', Bib.TrocaVirgulaPorPonto(qtEstoque));
        linha := linha + '|' + TNFeFloat3.Create(QProdutoConsVAL_VAREJO.Value).ToString;
        linha := linha + '|0.00|'+ TNFeFloat2.Create(QProdutoConsPERC_COMISSAO.Value).ToString;
        linha := linha + '|||||||' + TNFeFloat3.Create(QProdutoConsVAL_VAREJO.Value /
          Bib.ift(QProdutoConsNUM_EMBALAGEM.Value = 0, 1,QProdutoConsNUM_EMBALAGEM.Value)).ToString;
        linha := linha + '|' + QProdutoConsDESC_COD_BARRA.Value;
        linha := linha + '||||||||||';

        Writeln(arquivo, linha);
        QProdutoCons.Next;
      end;
      Cursor := crDefault;
      CloseFile(arquivo);
      ShowMessage('Exportação realizada com sucesso.');
    end;
  except
    on E: Exception do
      begin
        MessageDlg('Erro na exportação de produtos.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;
  Panel1.Enabled := True;
end;

procedure TFIntegracaoMGMobile.BTExportarDuplicatasClick(Sender: TObject);
var
  posVirgula: Integer;
  linha: String;
  arquivo: TextFile;
begin
  Panel1.Enabled := false;
  try
    with DMContasReceber do
    begin
      QContasReceber_CabCons.Close;
      QContasReceber_CabCons.SQL.Delete(QContasReceber_CabCons.SQL.Count - 1);
      QContasReceber_CabCons.SQL.Add(' AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ''BAIXA TOTAL''');
      QContasReceber_CabCons.Open;
      if FileExists('c:\mgmobile\imptxt\CADDUP.TXT') then
        DeleteFile('c:\mgmobile\imptxt\CADDUP.TXT');
      AssignFile(arquivo,  'c:\mgmobile\imptxt\CADDUP.TXT');
      Rewrite(arquivo);
      Cursor := crHourGlass;
      while not QContasReceber_CabCons.Eof do
      begin
        linha := QContasReceber_CabConsNUM_TITULO.Text;
        linha := linha + '|' + QContasReceber_CabConsDT_VENCIMENTO.Text;
        linha := linha + '|' + QContasReceber_CabConsCOD_CADASTRO.Text;
        linha := linha + '|' + TNFeFloat2.Create(QContasReceber_CabConsVAL_TITULO.Value).ToString;
        linha := linha + '|' + QContasReceber_CabConsDESC_OBSERVACAO.Value;

        Writeln(arquivo, linha);
        QContasReceber_CabCons.Next;
      end;
      Cursor := crDefault;
      CloseFile(arquivo);
      ShowMessage('Exportação realizada com sucesso.');
    end;
  except
    on E: Exception do
      begin
        MessageDlg('Erro na exportação de duplicatas.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;
  Panel1.Enabled := True;
end;

procedure TFIntegracaoMGMobile.BTExportarPrazosClick(Sender: TObject);
var
  linha: String;
  arquivo: TextFile;
begin
  Panel1.Enabled := false;
  try
    with DMPrazoVencimento do
    begin
      QPrazoVencimento_Cons.Close;
      QPrazoVencimento_Cons.SetVariable('IND_SITUACAO', 'ATIVO');
      QPrazoVencimento_Cons.Open;
      if FileExists('c:\mgmobile\imptxt\CADTPG.TXT') then
        DeleteFile('c:\mgmobile\imptxt\CADTPG.TXT');
      AssignFile(arquivo,  'c:\mgmobile\imptxt\CADTPG.TXT');
      Rewrite(arquivo);
      Cursor := crHourGlass;
      while not QPrazoVencimento_Cons.Eof do
      begin
        linha := QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO.Text;
        linha := linha + '|' + QPrazoVencimento_ConsDESC_PRAZO_VENCIMENTO.Value;
        linha := linha + '|' + TNFeFloat2.Create(QPrazoVencimento_ConsPERC_JUROS.Value).ToString;
        linha := linha + '|0.00||||||||||||||||';

        Writeln(arquivo, linha);
        QPrazoVencimento_Cons.Next;
      end;
      Cursor := crDefault;
      CloseFile(arquivo);
      ShowMessage('Exportação realizada com sucesso.');
    end;
  except
    on E: Exception do
      begin
        MessageDlg('Erro na exportação de condições de pagamento.' + #13 + #10 +
          E.Message, mtError, [mbOK], 0);
      end;
  end;
  Panel1.Enabled := true;
end;

procedure TFIntegracaoMGMobile.BTImportarPedidosClick(Sender: TObject);
var
  pedido, item, diretorios: TStringList;
  linha: String;
  arquivoPedido, arquivoItens: TextFile;
  produtoExiste: Boolean;
  i: Integer;
begin
  Panel1.Enabled := false;
  diretorios := TStringList.Create;
  SubDiretorios('c:\mgmobile\exptxt\',diretorios);
  if diretorios.Count > 0 then
  begin
    for i := 0 to diretorios.Count - 1 do
    begin
      if FileExists(diretorios[i] + 'ARQPED.TXT') then
      begin
        try
          AssignFile(arquivoPedido,
            diretorios[i] + 'ARQPED.TXT');
          Reset(arquivoPedido);
          DMPedido.QPedido.Open;
          DMOracle.DBCemapa.StartTransaction;
          while not Eof(arquivoPedido) do
          begin
            Readln(arquivoPedido, linha);
            pedido := TStringList.Create;
            Bib.Split('|',linha,pedido);

            with DMPedido do
            begin
              QPedidoCons.Close;
              QPedidoCons.SetVariable('NUM_PEDIDO', Trim(pedido[0]));
              QPedidoCons.SetVariable('DATA_I', Trim(pedido[1]));
              QPedidoCons.Open;
              if QPedidoCons.RecordCount = 0 then
                QPedido.Insert
              else
              begin
                QPedido.Close;
                QPedido.SetVariable('PK', QPedidoConsCOD_PEDIDO_CAB.Value);
                QPedido.Open;
                QPedido.Edit;
              end;
              QPedidoCOD_PEDIDO_WEB.Text := Trim(pedido[0]);
              if QPedidoSTEP_PEDIDO_WEB.Value = 0 then
                QPedidoSTEP_PEDIDO_WEB.Value := 1;
              QPedidoNUM_PEDIDO.Text := Trim(pedido[0]);
              QPedidoDT_EMISSAO.Text := Trim(pedido[1]);
              QPedidoCOD_CADASTRO.Text := Trim(pedido[2]);
              QPedidoCOD_PRAZO_VENCIMENTO.Text := Trim(pedido[8]);
              QPedidoCOD_VENDEDOR.Text := Trim(pedido[4]);
              QPedidoVAL_TOTAL.Text := StringReplace(Trim(pedido[5]), '.',',',[rfReplaceAll]);

              case StrToInt(Trim(pedido[6])) of
                1: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 1=BOLETO';
                2: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 2=CHEQUE';
                3: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 3=Dinheiro';
                4: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 4=Cartao';
                5: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 5=Carteira';
                6: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 6=Outro';
                99: QPedidoDESC_COMPLEMENTO_OBS.Value := 'MODALIDADE DE PAGAMENTO: 99=Orcamento';
              end;

              QPedidoIND_TIPO_FRETE.Value := Trim(pedido[12]);
              QPedidoCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
              if (QPedidoCOD_PRAZO_VENCIMENTO.Value = 29) or
                 (QPedidoCOD_PRAZO_VENCIMENTO.Value = 57) then
              begin
                QPedidoIND_TIPO_PAGAMENTO.Value := 'OUTROS';
                if (QPedidoCOD_PRAZO_VENCIMENTO.Value = 29) then
                  QPedidoCOD_OPERACAO.Value := 15
                else
                  QPedidoCOD_OPERACAO.Value := 30;
              end
              else if (QPedidoCOD_PRAZO_VENCIMENTO.Value = 1) then
              begin                                          
                QPedidoIND_TIPO_PAGAMENTO.Value := 'A VISTA';
                QPedidoCOD_OPERACAO.Value := 26;
              end
              else
              begin
                QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
                QPedidoCOD_OPERACAO.Value := 2;
              end;

              QPedidoCOD_OPERACAO.Value := DMUsuario.CodOperacaoPadrao;
              QPedido.Post;
              QPedido.Edit;
              AssignFile(arquivoItens,
                diretorios[i] + 'ARQIPE.TXT');
              Reset(arquivoItens);
              QPedidoItem.Close;
              QPedidoItem.Open;
              while not Eof(arquivoItens) do
              begin
                Readln(arquivoItens, linha);
                item := TStringList.Create;
                Bib.Split('|',linha,item);

                if Trim(item[0]) = Trim(pedido[0]) then
                begin
                  produtoExiste := False;
                  if QPedido.State = dsEdit then
                  begin
                    QPedidoItem.DisableControls;
                    QPedidoItem.AutoCalcFields := False;
                    produtoExiste := QPedidoItem.Locate('COD_PRODUTO', Trim(item[1]),[]);
                    QPedidoItem.EnableControls;
                    QPedidoItem.AutoCalcFields := True;
                  end;
                  if produtoExiste then
                    QPedidoItem.Edit
                  else
                    QPedidoItem.Insert;
                  QPedidoItemCOD_PEDIDO_CAB.Value := QPedidoCOD_PEDIDO_CAB.Value;
                  QPedidoItemCOD_PRODUTO.Text := Trim(item[1]);
                  QPedidoItemVAL_UNITARIO.Text := StringReplace(Trim(item[7]), '.',',',[rfReplaceAll]);
                  QPedidoQT_QUANTIDADE.Text := StringReplace(Trim(item[3]), '.',',',[rfReplaceAll]);
                  QPedidoItemPERC_DESCONTO.Text := StringReplace(Trim(item[4]), '.',',',[rfReplaceAll]);
                  if(QPedidoItemPERC_DESCONTO.Value < 0) then
                  begin
                    QPedidoItemVAL_UNITARIO.Text := StringReplace(Trim(item[2]), '.',',',[rfReplaceAll]);
                    QPedidoItemPERC_DESCONTO.Value := 0;
                  end;
                  QPedidoItemDESC_OBS_ITEM.Value := Trim(item[5]);
                  QPedidoItem.Post;
                end;
              end;
              CloseFile(arquivoItens);
              QPedido.Post;
            end;
          end;
          DMOracle.DBCemapa.Commit;
          DMPedido.QPedidoItem.Close;
          DMPedido.QPedido.Close;
          CloseFile(arquivoPedido);
          DeleteFile(diretorios[i] + 'ARQPED.TXT');
          DeleteFile(diretorios[i] + 'ARQIPE.TXT');           
        except
          on E: Exception do
            begin
              DMPedido.QPedido.Cancel;
              DMPedido.QPedidoItem.Cancel;
              DMOracle.DBCemapa.Rollback;
              MessageDlg('Erro na importação de pedidos.' + #13 + #10 +
                  E.Message, mtError, [mbOK], 0);
            end;
        end;
      end;
    end;
    ShowMessage('Importação realizada com sucesso.');
  end
  else
    ShowMessage('Não existem arquivos de pedidos a serem importados.');
  Panel1.Enabled := True;
end;

procedure TFIntegracaoMGMobile.BTImportarClientesClick(Sender: TObject);
var
  cadastro, diretorios: TStringList;
  linha: String;
  arquivo: TextFile;
  i: Integer;
begin
  Panel1.Enabled := false;
  diretorios := TStringList.Create;
  SubDiretorios('c:\mgmobile\exptxt\',diretorios);
  if diretorios.Count > 0 then
  begin
    for i := 0 to diretorios.Count - 1 do
    begin
      if FileExists(diretorios[i] + 'ARQCLI.TXT') then
      begin
        try
          AssignFile(arquivo,
            diretorios[i] + 'ARQCLI.TXT');
          Reset(arquivo);
          DMCadastro.QCadastro.Open;
          DMCadastro.QCadastro_Enderecos.Open;
          DMOracle.DBCemapa.StartTransaction;
          while not Eof(arquivo) do
          begin
            Readln(arquivo, linha);
            cadastro := TStringList.Create;
            Bib.Split('|',linha,cadastro);

            with DMCadastro do
            begin
              QCadastro.Close;
              QCadastro.SetVariable('PK',Trim(cadastro[0]));
              QCadastro.Open;
              if QCadastro.RecordCount = 0 then
                QCadastro.Insert
              else
                QCadastro.Edit;
              QCadastroCOD_CADASTRO.Text := Trim(cadastro[0]);
              QCadastroNOME.Value := Trim(cadastro[1]);
              QCadastroDESC_ENDERECO.Value := StringReplace(StringReplace(Trim(cadastro[2]), '[',', ', [rfReplaceAll]),']','',[rfReplaceAll]);
              QCadastroDESC_BAIRRO.Value := Trim(cadastro[3]);
              QCadastroDESC_CIDADE.Value := Trim(cadastro[4]);
              QCadastroCOD_ESTADO.Value := Trim(cadastro[5]);
              QCadastroDESC_CEP.Value := Trim(cadastro[6]);
              QCadastroNUM_CGC_CPF.Value := Trim(cadastro[7]);
              QCadastroNUM_INSCRICAO.Value := Trim(cadastro[8]);
              QCadastrodesc_telefone.Value := Trim(cadastro[9]);
              QCadastroDESC_FAX.Value := Trim(cadastro[10]);
              QCadastroNOME_CONTATO.Value := Trim(cadastro[11]);
              QCadastroDT_NASCIMENTO_CONTATO.Text := Trim(cadastro[12]);
              QCadastroDESC_OBS.Value := Trim(cadastro[13]);
              QCadastroCOD_VENDEDOR.Text := Trim(cadastro[14]);
              QCadastroDT_CADASTRO.Text := Trim(cadastro[15]);
              QCadastroVAL_LIMITE.Text := StringReplace(Trim(cadastro[16]),'.',',',[rfReplaceAll]);
              QCadastroDT_FUNDACAO.Text := Trim(cadastro[17]);
              QCadastroDESC_FANTASIA.Text := Trim(cadastro[33]);
              QCadastroIND_FISICA_JURIDICA.Value := Trim(cadastro[26]);
              QCadastroDESC_E_MAIL.Value := Trim(cadastro[29]);
              QCadastro.Post;
            end;
          end;
          DMOracle.DBCemapa.Commit;
          DMCadastro.QCadastro_Enderecos.Close;
          DMCadastro.QCadastro.Close;
          CloseFile(arquivo);
          DeleteFile(diretorios[i] + 'ARQCLI.TXT');
        except
          on E: Exception do
            begin
              DMOracle.DBCemapa.Rollback;
              MessageDlg('Erro na importação de clientes.' + #13 + #10 +
                  E.Message, mtError, [mbOK], 0);
            end;
        end;
      end;
    end;
    ShowMessage('Importação realizada com sucesso.');
  end
  else
    ShowMessage('Não existem arquivos de clientes a serem importados.');
  Panel1.Enabled := True;
end;

procedure TFIntegracaoMGMobile.SubDiretorios(Diretorio: string; var Lista: TStringList);
var  SearchRec: TSearchRec;
begin
	if FindFirst(Diretorio + '*.*', faDirectory, SearchRec) = 0 then
		repeat
			if (SearchRec.Attr and faDirectory = faDirectory) and		 (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
			begin
				Lista.Add(Diretorio + SearchRec.Name + '\');
				SubDiretorios(Diretorio + SearchRec.Name + '\', Lista);
			end;	
		until FindNext(SearchRec) <> 0;  
  FindClose(SearchRec);
end;

end.
